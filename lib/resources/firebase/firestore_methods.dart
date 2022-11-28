import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/models/Statistical_Data.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/models/user.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firebase/auth_methods.dart';
import 'package:patriots_parking/resources/firebase/firestore_path.dart';
import 'package:patriots_parking/resources/firebase/firestore_service.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:patriots_parking/resources/parking_data.dart';

class FirestoreMethods {
  final FirestoreService _firestoreService = FirestoreService.instance;
  late StreamSubscription _userDataSubscription;
  late StreamSubscription _parkingLotsSubscription;
  late StreamSubscription _parkingSpacesSubscription;
  late StreamSubscription _statisticalDataSubscription;

// subscripe to database collections
  Future<void> initializeSubscriptions() async {
    if (!(await _firestoreService.documentExists(
        path: FirestorePath.userData()))) {
      final userModel = UserModel();
      _firestoreService.addDocument(
          path: FirestorePath.users(),
          data: userModel.toJson(),
          myId: locator.get<AuthMethods>().uid);
    }
    final state = locator.get<AppState>();
    state.onParkingLotsChanged([]);
    _userDataSubscription = _firestoreService
        .documentStream(
            path: FirestorePath.userData(),
            builder: (data) => UserModel.fromJson(data))
        .listen((event) {
      state.onUserDataChanged(event);
    });
    _parkingLotsSubscription = _firestoreService
        .collectionStream(
            path: '/parkingLots', builder: (data) => ParkingLot.fromJson(data))
        .listen((event) {
      state.onParkingLotsChanged(event);
    });
    state.onParkingSpacesChanged([]);
    _parkingSpacesSubscription = _firestoreService
        .collectionStream(
            path: FirestorePath.parkingSpaces(),
            builder: (data) => ParkingSpace.fromJson(data))
        .listen((event) {
      state.onParkingSpacesChanged(event);
    });
    _statisticalDataSubscription = _firestoreService
        .collectionStream(
            path: FirestorePath.statisticalData(),
            builder: (data) => StatisticalData.fromJson(data))
        .listen((event) {
      state.onStatisticalDataChanged(event);
    });
  }

// pause subscriptions
  Future<void> pauseSubscriptions() async {
    _userDataSubscription.pause();
    _parkingLotsSubscription.pause();
    _parkingSpacesSubscription.pause();
    _statisticalDataSubscription.pause();
  }

// resume subscriptions
  Future<void> resumeSubscriptions() async {
    _userDataSubscription.resume();
    _parkingLotsSubscription.resume();
    _parkingSpacesSubscription.resume();
    _statisticalDataSubscription.resume();
  }

// cancel subscriptions
  Future<void> cancelSubscriptions() async {
    _userDataSubscription.cancel();
    _parkingLotsSubscription.cancel();
    _parkingSpacesSubscription.cancel();
    _statisticalDataSubscription.cancel();
  }

  Future<void> toggleBlocked(ParkingSpace space) async {
    if (space.blocked) {
      await FirestoreService.instance.updateDocument(
          path: FirestorePath.parkingSpace(space.id), data: {'blocked': false});
    } else {
      await FirestoreService.instance.updateDocument(
          path: FirestorePath.parkingSpace(space.id), data: {'blocked': true});
    }
  }

// toggle parking space state
  Future<void> toggleSpace(ParkingSpace space, {bool? forcedState}) async {
    DateTime time = DateTime.now();
    final instance = FirebaseFirestore.instance;
    final userDoc = instance.doc(FirestorePath.userData());
    final spaceDoc = instance.doc(FirestorePath.parkingSpace(space.id));
    final statsDoc =
        instance.doc(FirestorePath.statisticalData_(space.parkingLot));
    if (forcedState == null) {
      instance.runTransaction((transaction) async {
        final spaceData = await transaction
            .get(spaceDoc)
            .then((value) => ParkingSpace.fromJson(value.data()!));
        final userData = await transaction
            .get(userDoc)
            .then((value) => UserModel.fromJson(value.data()!));
        if (spaceData.open) {
          transaction.set(
            userDoc,
            {
              "spacesTaken": FieldValue.arrayUnion([space.id])
            },
            SetOptions(merge: true),
          );
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
        } else if (userData.spacesTaken.contains(space.id) && !space.open) {
          transaction.set(
              userDoc,
              {
                "spacesTaken": FieldValue.arrayRemove([space.id])
              },
              SetOptions(merge: true));
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
    } else {
      instance.runTransaction((transaction) async {
        final spaceData = await transaction
            .get(spaceDoc)
            .then((value) => ParkingSpace.fromJson(value.data()!));
        if (forcedState && !spaceData.open) {
          transaction.set(
            spaceDoc,
            {"open": true, "timeOpened": time},
            SetOptions(merge: true),
          );
        } else if (!forcedState && spaceData.open) {
          transaction.set(
            spaceDoc,
            {"open": false, "timeTaken": time},
            SetOptions(merge: true),
          );
        }
      });
    }
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

  Future<void> toggleAdmin(bool admin, {bool forget = false}) async {
    await FirestoreService.instance.updateDocument(
        path: FirestorePath.userData(),
        data: {'isAdmin': !forget, 'admin': admin});
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
    cancelSubscriptions();
    List<UserModel> users = await FirestoreService.instance.collectionFuture(
        path: FirestorePath.users(),
        builder: (data) => UserModel.fromJson(data));
    for (ParkingSpace space in locator.get<AppState>().parkingSpaces) {
      bool taken = false;
      for (UserModel user in users) {
        if (user.spacesTaken.contains(space.id)) {
          taken = true;
        }
      }
      if (taken) {
        await toggleSpace(space, forcedState: false);
      }
      await toggleSpace(space, forcedState: true);
    }
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
    initializeSubscriptions();
  }
}
