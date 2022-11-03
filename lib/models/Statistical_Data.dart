import 'package:patriots_parking/models/parking_lot.dart';
import 'package:flutter/material.dart';

/*
Class to display three boxes next to its parking lot, in the parking lot list
Stateful because it will change as a space is toggled. 
Additional statements have been placed in the togglespace method in firestore_methods.dart
added three additional methods to appstate.dart

decreaseStatiticalData to decrease available when space is red
increaseStatiticalData to increase available when space is green
StatisticalData getStatisticalData(ParkingLot lot) similar to getLotByName but with different type and return value.


*/
class StatisticalData extends StatefulWidget {
  ParkingLot parkinglot;
  int Total;
  int Available;
  int Occupied;

  StatisticalData({
    required this.parkinglot,
    required this.Total,
    required this.Available,
    required this.Occupied,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
