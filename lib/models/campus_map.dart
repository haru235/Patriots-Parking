import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/locator.dart';

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
        for (ParkingLot lot in locator.get<AppState>().parkingLots) ...[
          ParkingButton(x: lot.mapX, y: lot.mapY, name: lot.name)
        ]
      ],
    );
  }
}

class ParkingButton extends StatelessWidget {
  final num? x;
  final num? y;
  final String name;
  final double radius;
  const ParkingButton({
    this.x = 0,
    this.y = 0,
    required this.name,
    this.radius = 25,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: () => locator
            .get<AppState>()
            .setLot(locator.get<AppState>().getLotByName(name)),
        child: Container(
          width: radius * 2,
          height: radius * 2,
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
