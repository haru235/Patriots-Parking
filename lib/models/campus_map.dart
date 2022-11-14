import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:patriots_parking/resources/parking_data.dart';

class CampusMap extends StatelessWidget {
  const CampusMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          width: 1000,
          height: 1000,
          image: AssetImage('assets/uttylerMap.jpg'),
          fit: BoxFit.contain,
        ),
        for (ParkingLot lot in tempLots) ...[
          for (List<num> data in lot.buttonData) ...[
            ParkingButton1(name: lot.name, data: data),
          ]
        ],
      ],
    );
  }
}

class ParkingButton1 extends StatelessWidget {
  final String name;
  final List<num> data;
  const ParkingButton1({
    required this.name,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: data[0].toDouble(),
      top: data[1].toDouble(),
      child: data.length == 5
          ? Transform.rotate(
              alignment: Alignment.topLeft,
              angle: data[4].toDouble() / 180 * pi,
              child: GestureDetector(
                onTap: () => locator
                    .get<AppState>()
                    .setLot(locator.get<AppState>().getLotByName(name)),
                child: Container(
                  width: data[2].toDouble(),
                  height: data[3].toDouble(),
                  color: Colors.deepPurple,
                ),
              ),
            )
          : Text(
              name,
              style: const TextStyle(color: Colors.white),
            ),
    );
  }
}

class ParkingButton extends StatelessWidget {
  final String name;
  final double x;
  final double y;
  final double r;
  const ParkingButton({
    required this.name,
    this.x = 0,
    this.y = 0,
    this.r = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onTap: () => locator
            .get<AppState>()
            .setLot(locator.get<AppState>().getLotByName(name)),
        child: Container(
          width: r * 2,
          height: r * 2,
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(name),
          ),
        ),
      ),
    );
  }
}
