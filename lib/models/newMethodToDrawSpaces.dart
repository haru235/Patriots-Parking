import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'dart:math';
/*
new method to draw the spaces with a single method call, few changes made from method created by Haru.  This method is mainly for Lot 14, Lot 10, Lot 7 and Lot 9 and
Lot 15 because those lots have curves on them.  Starting with a row, count from the first space to the last space in that
row, starting from 0, 1, 2 ,3,,,,n.  Suppose there is row of 8 spaces, and a gap exists, the gap is between space 6 and 8.  
Estimate how much spaces the gap takes, suppose it takes the size of two spaces,, now assume the gap does not exist,
then count, 0 1 2 3 4 5 6 7 8 9, so ten total because of the gap composed of the size of two parkign spaces.  
the values of 6 and 7 represent the gap between 6 and 8, those values will go to the array
, named rownumberGaps.  so the application will display the intended 8 spaces
and the gap that is part of that row. The FixedR is to change the rate of direction change for each space as the tangent(rate) changes.
 The number of spaces can be extracted by this implementation for statitical data usage.
*/

String randomString(int length) {
  var random = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => random.nextInt(33) + 89));
}

void insertRow(
  String parkingLot,
  double x,
  double y,
  int spaceCount,
  double direction,
  int side,
) {
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

List<ParkingSpace> tempRowOneArrayPerSpaceRow(
  String parkingLot,
  double x,
  double y,
  int spaceCount,
  double direction,
  List<int>
      rownumberGaps, //array that holds location of gaps.  size of gaps is with respect to size of parking spaces
  int side,
  double FixedR, {
  //Rate of change of the tangent of a curve (Average)
  SpaceType type = SpaceType.normal,
}) {
  bool semaphore = true; //Activates
  double leftOrientation = 360 - direction;
  double rightOrientation = 180 - direction;
  List<ParkingSpace> list = [];

  int b = 0; //keeps track of the array index

  for (int i = 0; i < spaceCount + rownumberGaps.length; i++) {
    if (side == 0 || side == 2) {
      semaphore = true; //restarts semaphore to true for every iteration
      if (b < rownumberGaps.length) {
        //first check if b does not got greater than the size of
        if (i == rownumberGaps[b]) {
          //rownumberGaps to avoid out of range error
          direction =
              direction + FixedR; //then check if i is equal to a part of a gap
          b++; //if it is, then a gap has been reached, do not added to the list
          semaphore = false; //but continue increasing the rate so that the next
        } //valid parking space maintains its correct angle.
      } //activate semaphore to false so the gap is not added
      if (semaphore) {
        //recall that a gap is composed of parking spaces, but those
        list.add(
          //parking spaces are not displayed nor added to the list.
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
        direction = direction + FixedR;
      }
      //}
    }
    if (side == 1 || side == 2) {
      semaphore = true;
      if (b < rownumberGaps.length) {
        if (i == rownumberGaps[b]) {
          direction = direction + FixedR;
          b++;
          semaphore = false;
        }
      } //else {
      if (semaphore) {
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
        direction = direction + FixedR;
      }
      //}
    }
    x = x + cos(direction / 180 * pi) * 25;
    y = y + sin(direction / 180 * pi) * 25;
  }
  return list;
}
