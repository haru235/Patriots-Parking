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
class StatisticalData {
  // String parkinglot_Name;
  String? id;
  num? total;
  num? available;
  num? occupied;
  String? parkingLotName;

  StatisticalData({
    //required this.parkinglot_Name,
    this.id = '',
    required this.total,
    required this.available,
    required this.occupied,
    required this.parkingLotName,
    Key? key,
  });

  StatisticalData.widgetc(StatisticalData temp) {
    available = temp.available;
    total = temp.total;
    occupied = temp.occupied;
    id = temp.id;
    parkingLotName = temp.parkingLotName;
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
      'Total': total,
      'Available': available,
      'Occupied': occupied,
      'parking lot': parkingLotName
    };
  }

  static StatisticalData fromJson(Map<String, dynamic> json) {
    return StatisticalData(
      id: json['id'],
      total: json['Total'],
      available: json['Available'],
      occupied: json['Occupied'],
      parkingLotName: json['parking lot'],
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
}
