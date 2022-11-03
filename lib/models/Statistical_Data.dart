import 'package:patriots_parking/models/parking_lot.dart';
import 'package:flutter/material.dart';

/*
This class is to get the statistical data for the parking lots. Is a stateful Widget because the data will be changing as spaces are modified.  
The widgets to display the data will be  to the right side of the corresping lot once the createState method is properly implemented.  
If space is false, decrease Available, increase occupied
If space is true, increase Available, decrease occupied
Added a method to AppState.dart to get the index of the corresponding Statistical data from the array of Statistical data that is also created in the AppState.dart
The index will be acquired by comparing the name of space class and Statistical Data class, if their lot number matches.
Also added additional statements to the togglespace method in Firestore_methods.dart file.  The Data will be changed every time a space is toggled.
I will have the mentioned code commented until I fill the arrays properly and find any possible bugs that will likely occur when traversing the array of statistical data
(if no matches are found, add a error message).


*/
class StatisticalData extends StatefulWidget {
  String parkinglot_Name;
  int Total;
  int Available;
  int Occupied;

  StatisticalData({
    required this.parkinglot_Name,
    required this.Total,
    required this.Available,
    required this.Occupied,
    Key? key,
  }) : super(key: key);

  void decreaseStatiticalData(int i) {
    this.Available--;
    this.Occupied++;
  }

  void increaseStatiticalData(int i) {
    this.Available++;
    this.Occupied--;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
