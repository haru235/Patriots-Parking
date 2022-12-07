import 'package:flutter/cupertino.dart';
import 'package:patriots_parking/models/statistical_data.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/models/user.dart';
import 'package:patriots_parking/resources/parking_lot_data.dart';

class AppState with ChangeNotifier {
  UserModel userData = UserModel();
  ParkingLot? selectedLot;
  ParkingSpace? selectedSpace;
  List<ParkingLot> parkingLots = UTTLots;
  List<ParkingSpace> parkingSpaces = [];
  List<StatisticalData> statisticalData = [];

  // run when change in user data
  onUserDataChanged(UserModel newData) {
    userData = newData;
    notifyListeners();
  }

// run when change in parking space data
  onParkingSpacesChanged(List<ParkingSpace> newData) {
    parkingSpaces = newData;
    notifyListeners();
  }

// run when change in statistical data
  onStatisticalDataChanged(List<StatisticalData> newData) {
    statisticalData = newData;
    notifyListeners();
  }

// change selected lot
  void setLot(ParkingLot? lot) {
    selectedLot != lot ? selectedLot = lot : selectedLot = null;
    notifyListeners();
  }

// get parkingLot model by name
  ParkingLot getLotByName(String name) {
    return parkingLots.where((element) => element.name == name).first;
  }

// get statistical data of parking lot
  StatisticalData getStatisticalData(String name) {
    return statisticalData.firstWhere(
      (element) => element.parkingLotName == name,
      orElse: () => StatisticalData(
          total: 0, available: 0, occupied: 0, parkingLotName: name),
    );
  }
}
