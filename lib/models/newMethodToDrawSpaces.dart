import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'dart:math';


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
  String parkingLot,                               //fixed bug from temprow where spaces where not changing orientation, only the x and y where changing
  double x,                                        //Problem was that leftOrientation and rightOrientation never changed values since they were
  double y,                                        //outside the forloop.  Solution was to change the values for every iteration inside the for loop as in line 91.
  int spaceCount,                                  //added a array type to the parameters, this is to store where the gaps occur in a given row.  
  double direction,                                //Suppose a row has 6 spaces.  Suppose there is a gap between them that seperates space 3 and space 4.  Suppose
  List<int>                                        //The gap is the size of two parking spaces, then new array parameter will store two values to represent the gap.
      rownumberGaps,                               //These values represent spaces too, but they are not added to the list nor displayed but the direction keeps changing
  int side,                                        //so that when the 4th space is reached, it will have its correct value of orientation and x and y.  as in line 87-88
  double FixedR, {                                 //semaphore variable is for logic purposes.  If false, do not add, if true add space.  Variable b is to 
                                                   //prevent the array from going out of range and also using line 83 logic.  Not longer have to create a function
  SpaceType type = SpaceType.normal,               //for every row in a curved lot.  Fulfills enhancement of development tools.  10/30/2022 6:58PM Final Method.
}) {
  bool semaphore = true;
  double leftOrientation = 360 - direction;
  double rightOrientation = 180 - direction;
  List<ParkingSpace> list = [];

  int b = 0; 

  for (int i = 0; i < spaceCount + rownumberGaps.length; i++) {
    if (side == 0 || side == 2) {
      semaphore = true; 
      if (b < rownumberGaps.length) {
        
        if (i == rownumberGaps[b]) {
          
          direction =
              direction + FixedR;
          b++; 
          semaphore = false;
          leftOrientation = leftOrientation -
              FixedR;
        } 
      } 
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
        leftOrientation = leftOrientation - FixedR;
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
          leftOrientation = leftOrientation - FixedR;
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
        leftOrientation = leftOrientation - FixedR;
      }
      //}
    }
    x = x + cos(direction / 180 * pi) * 25;
    y = y + sin(direction / 180 * pi) * 25;
  }
  return list;
}
