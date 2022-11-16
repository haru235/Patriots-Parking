import 'dart:async';

import 'package:flutter/material.dart';
import 'package:patriots_parking/models/Statistical_Data.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firebase/firestore_path.dart';
import 'package:patriots_parking/resources/firebase/firestore_service.dart';
import 'package:patriots_parking/resources/locator.dart';

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
    StatisticalData temp;
    DateTime time = DateTime.now();
    if (!space.open && space.timeTaken != null) {
      time.difference(space.timeTaken!);
      debugPrint('Space ${space.id} released after $time.');
    }

    // i = locator.get<AppState>().getStatisticalData(space);
    //temp = locator.get<AppState>().Statistical_Data[i];
    FirestoreService.instance.updateDocument(
      path: FirestorePath.parkingSpace(space.id),
      data: space.open
          ? {
              'open': !space.open,
              'timeTaken': time,
              //decrease available
            }
          : {
              'open': !space.open,
              'timeOpened': time,
              //increase available
            },
    );

    temp = locator.get<AppState>().getStatisticalData(space.parkingLot);

    if (space.open) {
      temp.available = temp.available! - 1;
      //FirestoreService.instance.updateDocument(
      //path: FirestorePath.StatisticalData_(temp.id!),
      // data: {'Available': temp.Available! - 1});
    } else {
      temp.available = temp.available! + 1;
      //FirestoreService.instance.updateDocument(
      //   path: FirestorePath.StatisticalData_(temp.id!),
      //  data: {'Available': temp.Available! + 1});
    }
  }

  // adds parking space to 'spaces' collection
  Future<void> addSpace(ParkingSpace data, {String? customId}) async {
    Map<String, dynamic> map = data.toJson();
    map.addAll({'id': customId ?? ""});
    FirestoreService.instance.addDocument(
      path: FirestorePath.parkingSpaces(),
      data: map,
      myId: customId,
    );
  }
}
