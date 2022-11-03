import 'package:flutter/cupertino.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/parking_data.dart';

class AppState with ChangeNotifier {
  ParkingLot? selectedLot;
  List<ParkingLot> parkingLots = [];
  List<ParkingSpace> parkingSpaces = [];

// run when change in parking lot data
  onParkingLotsChanged(List<ParkingLot> newData) {
    parkingLots = newData + tempLots;
    notifyListeners();
  }

// run when change in parking space data
  onParkingSpacesChanged(List<ParkingSpace> newData) {
    parkingSpaces = newData + tempSpaces;
    notifyListeners();
  }

  void setLot(ParkingLot? lot) {
    selectedLot != lot ? selectedLot = lot : selectedLot = null;
    notifyListeners();
  }

  ParkingLot getLotByName(String name) {
    return parkingLots.where((element) => element.name == name).first;
  }
  /* 
    int getStatisticalData(ParkingSpace space) {
    int index = -1;
    String name = space.parkingLot;
    for (var i = 0; i < Statistical_Data.length; i++) {
      if (name == Statistical_Data[i].parkinglot_Name) {
        index = i;
        i = Statistical_Data.length;
      }
    }
    return index;
  }
  
  */
}
