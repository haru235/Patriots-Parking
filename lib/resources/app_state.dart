import 'package:flutter/cupertino.dart';
import 'package:patriots_parking/models/Statistical_Data.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/parking_data.dart';

class AppState with ChangeNotifier {
  ParkingLot? selectedLot;
  ParkingSpace? selectedSpace;
  List<ParkingLot> parkingLots = [];
  List<ParkingSpace> parkingSpaces = [];
  List<StatisticalData> parkingData = [];
  StatisticalData? data;
  Map<String, List<num>> spaceAvailability = {};

// run when change in parking lot data
  onParkingLotsChanged(List<ParkingLot> newData) {
    parkingLots = newData + tempLots;
    parkingLots.sort(((a, b) => a.name.compareTo(b.name)));
    notifyListeners();
  }

// run when change in parking space data
  onParkingSpacesChanged(List<ParkingSpace> newData) {
    parkingSpaces = newData + tempSpaces;
    notifyListeners();
  }

  onStatisticalDataChanged(List<StatisticalData> newData) {
    parkingData = newData + tempData;
  }

  void setLot(ParkingLot? lot) {
    selectedLot != lot ? selectedLot = lot : selectedLot = null;
    notifyListeners();
  }

  ParkingLot getLotByName(String name) {
    return parkingLots.where((element) => element.name == name).first;
  }

  int getStatisticalData(String lot) {
    int index = -1;
    String name = lot;
    for (var i = 0; i < parkingData.length; i++) {
      if (name == parkingData[i].parkingLotName) {
        index = i;
        break;
      }
    }
    return index;
  }
}
