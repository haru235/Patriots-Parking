import 'package:patriots_parking/models/slot.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/parking_lot_dada.dart';

class ParkingLot extends StatelessWidget {
  final String id;
  final String name;
  final double width;
  final double height;
  const ParkingLot({
    this.id = '',
    required this.name,
    required this.width,
    required this.height,
    super.key,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'width': width,
      'height': height,
    };
  }

  ParkingLot fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      width: json['width'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey,
      child: Stack(
        children: [
          for (Slot slot
              in slots.where((element) => element.parkingLot == name)) ...[slot]
        ],
      ),
    );
  }
}
