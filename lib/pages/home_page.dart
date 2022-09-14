import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/slot.dart';
import 'package:patriots_parking/parking_lot_dada.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ParkingLot _parkingLot = parkingLotTest;
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            child: Center(child: _parkingLot),
          ),
        ],
      ),
    );
  }
}
