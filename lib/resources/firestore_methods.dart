import 'dart:async';

import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firestore_path.dart';
import 'package:patriots_parking/resources/firestore_service.dart';
import 'package:patriots_parking/resources/locator.dart';

class FirestoreMethods {
  final FirestoreService _firestoreService = FirestoreService.instance;
  late StreamSubscription _parkingLotsSubscription;
  late StreamSubscription _parkingSpacesSubscription;

  Future<void> initializeSubscriptions() async {
    _parkingLotsSubscription = _firestoreService
        .collectionStream(
            path: '/parkingLots', builder: (data) => ParkingLot.fromJson(data))
        .listen((event) {
      locator.get<AppState>().onParkingLotsChanged(event);
    });

    _parkingSpacesSubscription = _firestoreService
        .collectionStream(
            path: FirestorePath.parkingSpaces(),
            builder: (data) => ParkingSpace.fromJson(data))
        .listen((event) {
      locator.get<AppState>().onParkingSpacesChanged(event);
    });
  }

  Future<void> pauseSubscriptions() async {
    _parkingLotsSubscription.pause();
    _parkingSpacesSubscription.pause();
  }

  Future<void> resumeSubscriptions() async {
    _parkingLotsSubscription.resume();
    _parkingSpacesSubscription.resume();
  }

  Future<void> cancelSubscriptions() async {
    _parkingLotsSubscription.cancel();
    _parkingSpacesSubscription.cancel();
  }

  Future<void> toggleSpace(ParkingSpace space) async {
    FirestoreService.instance.updateDocument(
      path: FirestorePath.parkingSpace(space.id),
      data: {'open': !space.open},
    );
  }
}
