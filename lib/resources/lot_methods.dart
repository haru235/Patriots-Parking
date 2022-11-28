import 'package:patriots_parking/models/parking_space.dart';
import 'dart:math';

String randomString(int length) {
  var random = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => random.nextInt(33) + 89));
}

/*
fixed bug from temprow where spaces where not changing orientation, only the x and y where changing
Problem was that leftOrientation and rightOrientation never changed values since they were
outside the forloop.  Solution was to change the values for every iteration inside the for loop as in line 91.
added a array type to the parameters, this is to store where the gaps occur in a given row.
Suppose a row has 6 spaces.  Suppose there is a gap between them that seperates space 3 and space 4.  Suppose
The gap is the size of two parking spaces, then new array parameter will store two values to represent the gap.
These values represent spaces too, but they are not added to the list nor displayed but the direction keeps changing
so that when the 4th space is reached, it will have its correct value of orientation and x and y.  as in line 87-88
semaphore variable is for logic purposes.  If false, do not add, if true add space.  Variable b is to 
prevent the array from going out of range and also using line 83 logic.  Not longer have to create a function
for every row in a curved lot.  Fulfills enhancement of development tools.  10/30/2022 6:58PM Final Method.
*/
List<ParkingSpace> createSpaceRow({
  required String lot,
  required double x,
  required double y,
  required int count,
  required double direction,
  required int side,
  double fixedR = 0,
  List<int> gaps = const [],
  SpaceType type = SpaceType.normal,
}) {
  bool semaphore = true;
  double leftOrientation = 360 - direction;
  double rightOrientation = 180 - direction;
  List<ParkingSpace> list = [];

  int b = 0;

  for (int i = 0; i < count + gaps.length; i++) {
    if (side == 0 || side == 2) {
      semaphore = true;
      if (b < gaps.length) {
        if (i == gaps[b]) {
          direction = direction + fixedR;
          b++;
          semaphore = false;
          leftOrientation = leftOrientation - fixedR;
        }
      }
      if (semaphore) {
        list.add(
          ParkingSpace(
            parkingLot: lot,
            positionX: x + cos(direction / 180 * pi) * 25,
            positionY: y + sin(direction / 180 * pi) * 25,
            orientation: leftOrientation,
            open: true,
            temp: true,
            type: type,
          ),
        );
        direction = direction + fixedR;
        leftOrientation = leftOrientation - fixedR;
      }
    }
    if (side == 1 || side == 2) {
      semaphore = true;
      if (b < gaps.length) {
        if (i == gaps[b]) {
          direction = direction + fixedR;
          b++;
          semaphore = false;
          rightOrientation = rightOrientation - fixedR;
        }
      }
      if (semaphore) {
        list.add(
          ParkingSpace(
            parkingLot: lot,
            positionX: x + cos(direction / 180 * pi) * 25,
            positionY: y + sin(direction / 180 * pi) * 25,
            orientation: rightOrientation,
            open: true,
            temp: true,
            type: type,
          ),
        );
        direction = direction + fixedR;
        rightOrientation = rightOrientation - fixedR;
      }
    }
    x = x + cos(direction / 180 * pi) * 25;
    y = y + sin(direction / 180 * pi) * 25;
  }
  return list;
}

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
