import 'dart:async';

import 'package:flutter/material.dart';
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

// subscripe to database collections
  Future<void> initializeSubscriptions() async {
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
  }

// pause subscriptions
  Future<void> pauseSubscriptions() async {
    _parkingLotsSubscription.pause();
    _parkingSpacesSubscription.pause();
  }

// resume subscriptions
  Future<void> resumeSubscriptions() async {
    _parkingLotsSubscription.resume();
    _parkingSpacesSubscription.resume();
  }

// cancel subscriptions
  Future<void> cancelSubscriptions() async {
    _parkingLotsSubscription.cancel();
    _parkingSpacesSubscription.cancel();
  }

// toggle parking space state
  Future<void> toggleSpace(ParkingSpace space) async {
    DateTime time = DateTime.now();
    if (space.open && space.timeTaken != null) {
      time.difference(space.timeTaken!);
      debugPrint('Space ${space.id} released after $time.');
    }
    FirestoreService.instance.updateDocument(
      path: FirestorePath.parkingSpace(space.id),
      data: space.open
          ? {
              'open': !space.open,
              'timeTaken': time,
            }
          : {
              'open': !space.open,
              'timeOpened': time,
            },
    );
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
