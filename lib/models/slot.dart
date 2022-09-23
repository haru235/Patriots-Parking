import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/firestore_service.dart';

class Slot extends StatefulWidget {
  final String id;
  final String parkingLot;
  final double positionX;
  final double positionY;
  final double orientation;
  final bool open;
  const Slot({
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

  Slot fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['id'],
      parkingLot: json['parking lot'],
      positionX: json['x'],
      positionY: json['y'],
      orientation: json['orientation'],
      open: json['open'],
    );
  }

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.positionX,
      bottom: widget.positionY,
      child: Transform.rotate(
        alignment: Alignment.bottomRight,
        angle: widget.orientation / 180 * pi,
        child: GestureDetector(
          onTap: () => setState(() {
            isOpen = !isOpen;
            FirestoreService.instance.updateDocument(
                path: '/test/test', data: {'value': FieldValue.increment(1)});
          }),
          child: Container(
            width: 50,
            height: 100,
            decoration: BoxDecoration(
              color: isOpen ? Colors.green : Colors.red,
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
