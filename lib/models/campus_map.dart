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
            ParkingButton(name: lot.name, data: data),
          ]
        ],
      ],
    );
  }
}

class ParkingButton extends StatelessWidget {
  final String name;
  final List<num> data;
  const ParkingButton({
    required this.name,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: data[0].toDouble(),
      top: data[1].toDouble(),
      child: GestureDetector(
        onTap: () => locator
            .get<AppState>()
            .setLot(locator.get<AppState>().getLotByName(name)),
        child: data.length == 5
            ? Transform.rotate(
                alignment: Alignment.topLeft,
                angle: data[4].toDouble() / 180 * pi,
                child: Container(
                  width: data[2].toDouble(),
                  height: data[3].toDouble(),
                  color: Colors.deepPurple,
                ),
              )
            : Text(
                name.replaceFirst('Lot', 'P'),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
      ),
    );
  }
}
