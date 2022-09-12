import 'package:patriots_parking/models/slot.dart';
import 'package:flutter/material.dart';

class ParkingLot extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final List<Slot> slots;
  const ParkingLot({
    required this.name,
    required this.width,
    required this.height,
    required this.slots,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey,
      child: Stack(
        children: [
          for (Slot slot in slots) ...[slot]
        ],
      ),
    );
  }
}
