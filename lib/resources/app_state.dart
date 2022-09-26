import 'package:flutter/cupertino.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';

class AppState with ChangeNotifier {
  List<ParkingLot> parkingLots = [];
  List<ParkingSpace> parkingSpacess = [];

  onParkingLotsChanged(List<ParkingLot> newData) {
    parkingLots = newData;
    notifyListeners();
  }

  onParkingSpacesChanged(List<ParkingSpace> newData) {
    parkingSpacess = newData;
    notifyListeners();
  }
}
