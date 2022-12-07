import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:provider/provider.dart';
import 'package:patriots_parking/resources/road_paint.dart';

// parking lot object
class ParkingLot extends StatelessWidget {
  final String id;
  final String name;
  final num width;
  final num height;
  final List<List<num>> buttonData;
  final List<List<num>> roadPath;
  const ParkingLot({
    this.id = '',
    required this.name,
    required this.width,
    required this.height,
    this.buttonData = const [],
    this.roadPath = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      height: height.toDouble(),
      child: CustomPaint(
        painter: RoadPaint(path: roadPath),
        // update when parkingSpaces data changed
        child: Selector<AppState, List<ParkingSpace>>(
          selector: (p0, p1) => p1.parkingSpaces,
          builder: (_, value, __) {
            return Stack(
              children: [
                ...(value).where((element) => element.parkingLot == name),
              ],
            );
          },
        ),
      ),
    );
  }
}
