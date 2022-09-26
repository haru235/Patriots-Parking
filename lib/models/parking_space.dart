import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/resources/firestore_service.dart';
import 'package:patriots_parking/resources/locator.dart';

class ParkingSpace extends StatefulWidget {
  final String id;
  final String parkingLot;
  final num positionX;
  final num positionY;
  final num orientation;
  final bool open;
  const ParkingSpace({
    this.id = '',
    required this.parkingLot,
    required this.positionX,
    required this.positionY,
    required this.orientation,
    required this.open,
    Key? key,
  }) : super(key: key);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parking lot': parkingLot,
      'x': positionX,
      'y': positionY,
      'orientation': orientation,
      'open': open,
    };
  }

  static ParkingSpace fromJson(Map<String, dynamic> json) {
    return ParkingSpace(
      id: json['id'],
      parkingLot: json['parking lot'],
      positionX: json['x'],
      positionY: json['y'],
      orientation: json['orientation'],
      open: json['open'],
    );
  }

  @override
  State<ParkingSpace> createState() => _ParkingSpaceState();
}

class _ParkingSpaceState extends State<ParkingSpace> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.positionX.toDouble(),
      bottom: widget.positionY.toDouble(),
      child: Transform.rotate(
        alignment: Alignment.bottomRight,
        angle: widget.orientation / 180 * pi,
        child: GestureDetector(
          onTap: () => setState(() {
            locator.get<FirestoreMethods>().toggleSpace(widget);
            FirestoreService.instance.updateDocument(
                path: '/test/test', data: {'value': FieldValue.increment(1)});
          }),
          child: Container(
            width: 50,
            height: 100,
            decoration: BoxDecoration(
              color: widget.open ? Colors.green : Colors.red,
              border: const Border(
                left: BorderSide(color: Colors.white, width: 3),
                right: BorderSide(color: Colors.white, width: 3),
                bottom: BorderSide(color: Colors.white, width: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
