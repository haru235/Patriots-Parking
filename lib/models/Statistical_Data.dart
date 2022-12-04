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
import 'package:flutter/material.dart';

class StatisticalData {
  // String parkinglot_Name;
  final String? id;
  final num? total;
  final num? available;
  final num? occupied;
  final String? parkingLotName;

  const StatisticalData({
    //required this.parkinglot_Name,
    this.id = '',
    required this.total,
    required this.available,
    required this.occupied,
    required this.parkingLotName,
    Key? key,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total': total,
      'available': available,
      'occupied': occupied,
      'parking lot': parkingLotName
    };
  }

  static StatisticalData fromJson(Map<String, dynamic> json) {
    return StatisticalData(
      id: json['id'],
      total: json['total'],
      available: json['available'],
      occupied: json['occupied'],
      parkingLotName: json['parking lot'],
    );
  }
}
