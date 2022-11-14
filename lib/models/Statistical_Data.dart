import 'package:flutter/material.dart';

//added new class for statisticaldata
//number of Available spaces contained in a box next to parking lot number
//box changes colors.  if many available, box is blue, if not many available, box is yellow
//users don't have to tap every lot to see which ones have spaces open, users can just look at the available spaces box
//less usage of mobile device while finding spaces = more safety, requirmenet phase 1
//statistical data can be scalable with more type of data in the future, requirement phase 1
//updated firestore methods, togglespace method, gets lot number of space tapped, matches names with statistical data's assigned parking lot
//updated parking page, layout of widgets
//updated Appstate, needed variables
//updated firestorepaths, for new database collection
//updated main, added multiprovider, not sure if needed.

//11/14/2022
class StatisticalData extends StatefulWidget {
  // String parkinglot_Name;
  String? id;
  num? Total;
  num? Available;
  num? Occupied;
  String? parkinglot_Name;

  StatisticalData({
    //required this.parkinglot_Name,
    this.id = '',
    required this.Total,
    required this.Available,
    required this.Occupied,
    required this.parkinglot_Name,
    Key? key,
  }) : super(key: key);

  StatisticalData.widgetc(StatisticalData temp) {
    this.Available = temp.Available;
    this.Total = temp.Total;
    this.Occupied = temp.Occupied;
    this.id = temp.id;
    this.parkinglot_Name = temp.parkinglot_Name;
  }
/*
  const StatisticalDatawidget ({
  this.id = '',
  this.Available = 0,
  this.Total = 0,
  this.Occupied = 0,
}) : super(key: key);
*/

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Total': Total,
      'Available': Available,
      'Occupied': Occupied,
      'parking lot': parkinglot_Name
    };
  }

  static StatisticalData fromJson(Map<String, dynamic> json) {
    return StatisticalData(
      id: json['id'],
      Total: json['Total'],
      Available: json['Available'],
      Occupied: json['Occupied'],
      parkinglot_Name: json['parking lot'],
    );
  }

/*
  void decreaseStatiticalData(int i) {
    this.Available--;
    this.Occupied++;
  }

  void increaseStatiticalData(int i) {
    this.Available++;
    this.Occupied--;
  }

  bool checkColor() {
    if (this.Available > this.Total / 2)
      return true;
    else
      return false;
  }
*/
  @override
  State<StatisticalData> createState() => _StatisticalDataState();
}

class _StatisticalDataState extends State<StatisticalData> {
  @override
  Widget build(BuildContext context) {
    //StatisticalData? temp;
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: widget.Available! > widget.Total! / 2
                ? Colors.blue
                : Colors.yellow),
        child: Center(child: Text(widget.Available.toString())));
  }
}
