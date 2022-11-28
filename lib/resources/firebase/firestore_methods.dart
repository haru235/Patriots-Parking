import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/models/Statistical_Data.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firebase/firestore_path.dart';
import 'package:patriots_parking/resources/firebase/firestore_service.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:patriots_parking/resources/parking_data.dart';

class FirestoreMethods {
  final FirestoreService _firestoreService = FirestoreService.instance;
  late StreamSubscription _parkingLotsSubscription;
  late StreamSubscription _parkingSpacesSubscription;
  late StreamSubscription _statisticalDataSubscription;

// subscripe to database collections
  Future<void> initializeSubscriptions() async {
    locator.get<AppState>().onParkingLotsChanged([]);
    _parkingLotsSubscription = _firestoreService
        .collectionStream(
            path: '/parkingLots', builder: (data) => ParkingLot.fromJson(data))
        .listen((event) {
      locator.get<AppState>().onParkingLotsChanged(event);
    });
    locator.get<AppState>().onParkingSpacesChanged([]);
    _parkingSpacesSubscription = _firestoreService
        .collectionStream(
            path: FirestorePath.parkingSpaces(),
            builder: (data) => ParkingSpace.fromJson(data))
        .listen((event) {
      locator.get<AppState>().onParkingSpacesChanged(event);
    });
    _statisticalDataSubscription = _firestoreService
        .collectionStream(
            path: FirestorePath.statisticalData(),
            builder: (data) => StatisticalData.fromJson(data))
        .listen((event) {
      locator.get<AppState>().onStatisticalDataChanged(event);
    });
  }

// pause subscriptions
  Future<void> pauseSubscriptions() async {
    _parkingLotsSubscription.pause();
    _parkingSpacesSubscription.pause();
    _statisticalDataSubscription.pause();
  }

// resume subscriptions
  Future<void> resumeSubscriptions() async {
    _parkingLotsSubscription.resume();
    _parkingSpacesSubscription.resume();
    _statisticalDataSubscription.resume();
  }

// cancel subscriptions
  Future<void> cancelSubscriptions() async {
    _parkingLotsSubscription.cancel();
    _parkingSpacesSubscription.cancel();
    _statisticalDataSubscription.cancel();
  }

// toggle parking space state
  Future<void> toggleSpace(ParkingSpace space) async {
    DateTime time = DateTime.now();
    final instance = FirebaseFirestore.instance;
    final spaceDoc = instance.doc(FirestorePath.parkingSpace(space.id));
    final statsDoc =
        instance.doc(FirestorePath.statisticalData_(space.parkingLot));
    instance.runTransaction((transaction) async {
      final spaceData = await transaction.get(spaceDoc);
      if (spaceData.get("open")) {
        transaction.set(
          spaceDoc,
          {"open": false, "timeTaken": time},
          SetOptions(merge: true),
        );
        transaction.set(
          statsDoc,
          {"available": FieldValue.increment(-1)},
          SetOptions(merge: true),
        );
      } else {
        transaction.set(
          spaceDoc,
          {"open": true, "timeOpened": time},
          SetOptions(merge: true),
        );
        transaction.set(
          statsDoc,
          {"available": FieldValue.increment(1)},
          SetOptions(merge: true),
        );
      }
    });
  }

  // adds parking space to 'spaces' collection
  Future<void> addSpace(ParkingSpace data, {String? customId}) async {
    Map<String, dynamic> map = data.toJson();
    map.addAll({'id': customId ?? ""});
    await FirestoreService.instance.addDocument(
      path: FirestorePath.parkingSpaces(),
      data: map,
      myId: customId,
    );
  }

// reupload parking spaces from tempSpaces
// use only when necessary
  Future<void> addAllSpacesToCollection() async {
    cancelSubscriptions();
    for (ParkingLot lot in locator.get<AppState>().parkingLots) {
      int counter = 0;
      for (ParkingSpace space
          in tempSpaces.where((element) => element.parkingLot == lot.name)) {
        await addSpace(space, customId: "${lot.name}~$counter");
        counter++;
        await Future.delayed(const Duration(milliseconds: 10));
      }
      debugPrint("${lot.name} Complete");
    }
    initializeSubscriptions();
    debugPrint("Uploaded All ParkingSpaces");
  }

  Future<void> calibrateStatisticalData() async {
    for (ParkingLot lot in locator.get<AppState>().parkingLots) {
      Iterable<ParkingSpace> spaces = locator
          .get<AppState>()
          .parkingSpaces
          .where((element) => element.parkingLot == lot.name);
      int total = spaces.length;
      int available = spaces.where((element) => element.open).length;
      int occupied = spaces.where((element) => !element.open).length;
      await FirestoreService.instance.addDocument(
        path: FirestorePath.statisticalData(),
        data: StatisticalData(
          total: total,
          available: available,
          occupied: occupied,
          parkingLotName: lot.name,
        ).toJson(),
        myId: lot.name,
      );
    }
  }
}
