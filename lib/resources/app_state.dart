import 'package:flutter/cupertino.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';

class AppState with ChangeNotifier {
  List<ParkingLot> parkingLots = [];
  List<ParkingSpace> parkingSpacess = [];

// run when change in parking lot data
  onParkingLotsChanged(List<ParkingLot> newData) {
    parkingLots = newData;
    notifyListeners();
  }

// run when change in parking space data
  onParkingSpacesChanged(List<ParkingSpace> newData) {
    parkingSpacess = newData;
    notifyListeners();
  }
}
