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
  /* Not Finished
    void decreaseStatiticalData(StatisticalData statitical_Data) {
    statitical_Data.Available--;
    statitical_Data.Occupied++;
  }

  void increaseStatiticalData(StatisticalData statitical_Data) {
    statitical_Data.Available++;
    statitical_Data.Occupied--;
    
    int getStatisticalData(List<ParkingLot> lot, List<StatisticalData lot_Data) {   //After index of the StatisticalDAta that corresponds to a lot is acquired,
    String name;                                                                    //use that index value in the array of StatisticalData, and then use
    int index;                                                                      //the methods above to increase or decrease its values.
    for (var i = 0; i < lot.length; i++ 
    {
      if lot[i].name = lot_Data.
    }
    return index;
  }
  */
}
