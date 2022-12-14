import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/models/statistical_data.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/models/user.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firebase/auth_methods.dart';
import 'package:patriots_parking/resources/firebase/firestore_path.dart';
import 'package:patriots_parking/resources/firebase/firestore_service.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:patriots_parking/resources/parking_space_data.dart';

// methods that uses the firestore service methods for indirect communication with firestore
class FirestoreMethods {
  final FirestoreService _firestoreService = FirestoreService.instance;
  late StreamSubscription _userDataSubscription;
  late StreamSubscription _parkingSpacesSubscription;
  late StreamSubscription _statisticalDataSubscription;

// subscripe to database collections
  Future<void> initializeSubscriptions() async {
    if (!(await _firestoreService.documentExists(
        path: FirestorePath.userData()))) {
      final userModel = UserModel();
      await _firestoreService.addDocument(
          path: FirestorePath.users(),
          data: userModel.toJson(),
          myId: locator.get<AuthMethods>().uid);
    }
    final state = locator.get<AppState>();
    _userDataSubscription = _firestoreService
        .documentStream(
            path: FirestorePath.userData(),
            builder: (data) => UserModel.fromJson(data))
        .listen((event) {
      state.onUserDataChanged(event);
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
    _parkingSpacesSubscription.pause();
    _statisticalDataSubscription.pause();
  }

// resume subscriptions
  Future<void> resumeSubscriptions() async {
    _userDataSubscription.resume();
    _parkingSpacesSubscription.resume();
    _statisticalDataSubscription.resume();
  }

// cancel subscriptions
  Future<void> cancelSubscriptions() async {
    _userDataSubscription.cancel();
    _parkingSpacesSubscription.cancel();
    _statisticalDataSubscription.cancel();
  }

// toggle blocked state of parking space
  Future<void> toggleBlocked(ParkingSpace space) async {
    // unblock if blocked
    if (space.blocked) {
      await FirestoreService.instance.updateDocument(
        path: FirestorePath.parkingSpace(space.id),
        data: {'blocked': false},
      );
      if (space.open) {
        FirestoreService.instance.updateDocument(
            path: FirestorePath.statisticalData_(space.parkingLot),
            data: {"available": FieldValue.increment(1)});
      }
      // block if unblocked
    } else {
      await FirestoreService.instance.updateDocument(
        path: FirestorePath.parkingSpace(space.id),
        data: {'blocked': true},
      );
      if (space.open) {
        FirestoreService.instance.updateDocument(
            path: FirestorePath.statisticalData_(space.parkingLot),
            data: {"available": FieldValue.increment(-1)});
      }
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
      // use transaction to avoid collision
      instance.runTransaction((transaction) async {
        final spaceData = await transaction
            .get(spaceDoc)
            .then((value) => ParkingSpace.fromJson(value.data()!));
        final userData = await transaction
            .get(userDoc)
            .then((value) => UserModel.fromJson(value.data()!));
        // set open to false if open
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
          // set open to true if not open and is taken by user
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
      // force open state of parking space
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

// toggles user admin state. Set forget to true to require reentering of passcode.
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

// Scans through user data and opens spaces that are not taken by any user.
// Then updates availability data
  Future<void> calibrateStatisticalData() async {
    List<UserModel> users = await FirestoreService.instance.collectionFuture(
        path: FirestorePath.users(),
        builder: (data) => UserModel.fromJson(data));
    List<String> takenIds = [];
    for (UserModel user in users) {
      takenIds.addAll(user.spacesTaken);
    }
    List<ParkingSpace> spaces = locator.get<AppState>().parkingSpaces;
    cancelSubscriptions();
    for (ParkingSpace space in spaces) {
      if (takenIds.contains(space.id)) {
        await toggleSpace(space, forcedState: false);
      } else {
        await toggleSpace(space, forcedState: true);
      }
    }
    // recalculate statistical data of each parking lot
    for (ParkingLot lot in locator.get<AppState>().parkingLots) {
      Iterable<ParkingSpace> lotSpaces =
          spaces.where((element) => element.parkingLot == lot.name);
      int total = lotSpaces.length;
      int available =
          lotSpaces.where((element) => element.open && !element.blocked).length;
      int occupied =
          lotSpaces.where((element) => !element.open || element.blocked).length;
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
