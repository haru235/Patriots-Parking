import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'dart:math';

//This new File makes the spaces for a row in a parking lot, i suppose each row will need this method call, but thats faster than drawing each space individually.
//in the spacerows method, a void method, the x and y are first estimated by using firebase.  The location of the first space in a row is estimated
//in firebase by updating the x and y in real time, and once a appropiate place is found for that space, just copy the x and y into the method spacerows and
//for spaceCount just say how many spaces from left to right.  7:44AM 10/4/2022
String randomString(int length) {
  var random = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => random.nextInt(33) + 89));
}

// (HS 10/5/22 @ 1:15AM) renamed to insertRow()
//    added direction and side.
//    direction: 0 = East, direction 90 = North, etc.
//    side 0 = left only, side 1 = right only, side 2 = both
void insertRow(String parkingLot, double x, double y, int spaceCount,
    double direction, int side) {
  double leftOrientation = 360 - direction;
  double rightOrientation = 180 - direction;
  ParkingSpace temp;
  for (int i = 0; i < spaceCount; i++) {
    if (side == 0 || side == 2) {
      temp = ParkingSpace(
        parkingLot: parkingLot,
        positionX: x + cos(direction / 180 * pi) * 25,
        positionY: y + sin(direction / 180 * pi) * 25,
        orientation: leftOrientation,
        open: true,
      );
      locator.get<FirestoreMethods>().addSpace(temp);
    }
    if (side == 1 || side == 2) {
      temp = ParkingSpace(
        parkingLot: parkingLot,
        positionX: x,
        positionY: y,
        orientation: rightOrientation,
        open: true,
      );
      locator.get<FirestoreMethods>().addSpace(temp);
    }
    x = x + cos(direction) * 25;
    y = y + sin(direction) * 25;
  }
}

// (HS 10/5/22 @1:20AM) duplicate of above, except instead of adding spaces to firestore, returns list for testing
List<ParkingSpace> tempRow(String parkingLot, double x, double y,
    int spaceCount, double direction, int side) {
  double leftOrientation = 360 - direction;
  double rightOrientation = 180 - direction;
  List<ParkingSpace> list = [];
  for (int i = 0; i < spaceCount; i++) {
    if (side == 0 || side == 2) {
      list.add(
        ParkingSpace(
          parkingLot: 'Lot15',
          positionX: x + cos(direction / 180 * pi) * 25,
          positionY: y + sin(direction / 180 * pi) * 25,
          orientation: leftOrientation,
          open: true,
          temp: true,
        ),
      );
    }
    if (side == 1 || side == 2) {
      list.add(
        ParkingSpace(
          parkingLot: 'Lot15',
          positionX: x,
          positionY: y,
          orientation: rightOrientation,
          open: true,
          temp: true,
        ),
      );
    }
    x = x + cos(direction / 180 * pi) * 25;
    y = y + sin(direction / 180 * pi) * 25;
  }
  return list;
}
