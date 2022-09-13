import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/firestore_service.dart';

class Slot extends StatefulWidget {
  final double positionX;
  final double positionY;
  final double orientation;
  final bool open;
  const Slot(
      {required this.positionX,
      required this.positionY,
      required this.orientation,
      required this.open,
      Key? key})
      : super(key: key);

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
            FirestoreService.instance
                .addDocument(path: '/test', data: {'hey': 4});
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
