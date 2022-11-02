import 'package:patriots_parking/models/parking_space.dart';
import 'dart:math';

//TODO remove file, transition to new createSpaceRow method
List<ParkingSpace> tempRow(
  String parkingLot,
  double x,
  double y,
  int spaceCount,
  double direction,
  int side, {
  SpaceType type = SpaceType.normal,
}) {
  double leftOrientation = 360 - direction;
  double rightOrientation = 180 - direction;
  List<ParkingSpace> list = [];
  for (int i = 0; i < spaceCount; i++) {
    if (side == 0 || side == 2) {
      list.add(
        ParkingSpace(
          parkingLot: parkingLot,
          positionX: x + cos(direction / 180 * pi) * 25,
          positionY: y + sin(direction / 180 * pi) * 25,
          orientation: leftOrientation,
          open: true,
          temp: true,
          type: type,
        ),
      );
    }
    if (side == 1 || side == 2) {
      list.add(
        ParkingSpace(
          parkingLot: parkingLot,
          positionX: x,
          positionY: y,
          orientation: rightOrientation,
          open: true,
          temp: true,
          type: type,
        ),
      );
    }
    x = x + cos(direction / 180 * pi) * 25;
    y = y + sin(direction / 180 * pi) * 25;
  }
  return list;
}
