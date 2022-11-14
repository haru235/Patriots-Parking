
import 'package:flutter/material.dart';


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
        width: 25,
        height: 50,
        decoration: BoxDecoration(
            color: widget.Available! > widget.Total! / 2
                ? Colors.blue
                : Colors.yellow),
        child: Text('${widget.Available}'));
  }
}
