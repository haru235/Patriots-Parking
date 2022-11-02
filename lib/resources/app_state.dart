import 'package:flutter/cupertino.dart';
import 'package:patriots_parking/models/documentcreate.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/models/newMethodToDrawSpaces.dart';

class AppState with ChangeNotifier {
  List<ParkingLot> tempLots = [
    const ParkingLot(
      name: 'Lot18',
      width: 700,
      height: 800,
      roadPath: [
        [100, 800, 100, 425],
        // vertical road next to handicap
        [225, 650, 225, 375],
        // middle vertical road
        [375, 100, 375, 750],
        // vertical road on right
        [525, 50, 525, 750],
        // horizontal road right after entrance
        [100, 750, 550, 750],
        // short horizontal road
        [225, 625, 375, 625],
        // curved road near handicap
        [225, 375, 225, 300, 375, 300],
        // curved road in front of garage
        [100, 425, 125, 100, 525, 50],
        // path to parking garage
        [225, 150, 200, 100],
      ],
    ),
    const ParkingLot(
      name: 'Lot15',
      width: 1300,
      height: 1000,
      roadPath: [
        [1300, 900, 75, 900], //entrance into Soules College
        [75, 900, 37, 930], // to make curve 1
        [37, 930, 0, 990], // to make curve 1.a
        [725, 900, 725, 300],
        // main road that divides the two sections of parkinglot
        [725, 300, 25, 300],
        // left section, top road, contains most parking spaces, 26.
        [25, 300, 25, 940], //road that intersects the curve that goes to lot 18
        [725, 450, 1250, 450],
        //road where the handicap spaces are near the tennis courts
        [750, 790, 1250, 790],
        //first road to the right of the main entrance that divides the parking lots
        [1220, 450, 1220, 790], //most right road in the left section
        [725, 615, 1220, 615], // middle road in the left section
        [725, 300, 700, 200],
        [700, 200, 645, 150],
        [645, 150, 490, 80],
        [490, 80, 0, 0],
        //the four lines to create the curve on the top   //ends here for roads
      ],
    ),
        const ParkingLot(   //To Test new method to draw spaces rows with gaps
      name: 'Lot9',
      width: 2000,
      height: 1500,
      roadPath: [[]],
    ),
    const ParkingLot(name: 'Lot14', width: 1500, height: 1000, roadPath: []),   //need to update old space data, new method will be used to add the spaces for lot14 and lot10
    const ParkingLot(name: 'Lot10', width: 1200, height: 2200, roadPath: []),   //spaces will be added later to github
    //10/16/2022 added lot15 parkinglot                                         
  ]; // temp parking lots for testing without firebase
  List<ParkingSpace> tempSpaces = [
    // added to firestore @ 10/17/22
    // ...tempRow('Lot18', 175, 100, 5, 0, 0),
    // ...tempRow('Lot18', 125, 150, 5, 90, 1),
    // ...tempRow('Lot18', 125, 275, 1, 90, 1, type: SpaceType.handicap),
    // ...tempRow('Lot18', 125, 310, 1, 90, 1, type: SpaceType.handicapR),
    // ...tempRow('Lot18', 125, 345, 1, 90, 1, type: SpaceType.handicapR),
    // ...tempRow('Lot18', 125, 380, 1, 90, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot18', 125, 405, 1, 90, 1, type: SpaceType.handicap),
    // ...tempRow('Lot18', 425, 100, 10, 90, 2),
    // ...tempRow('Lot18', 425, 375, 11, 90, 0),
    // ...tempRow('Lot18', 425, 375, 12, 90, 1),
    // ...tempRow('Lot18', 575, 25, 8, 90, 0),
    // ...tempRow('Lot18', 575, 250, 9, 90, 0),
    // ...tempRow('Lot18', 575, 500, 8, 90, 0),
    // ...tempRow('Lot18', 275, 225, 8, 90, 1),
    // ...tempRow('Lot18', 275, 225, 7, 90, 0),
    // ...tempRow('Lot18', 275, 768, 5, 18, 1),
    // ...tempRow('Lot15', -25, 785, 26, 0,
    //     1), //1 Lot 15 spaces data starts here 10/16/2022
    // ...tempRow('Lot15', 750, 125, 17, 0, 0), //2
    // ...tempRow('Lot15', 1275, 175, 16, 90, 0), //3
    // ...tempRow('Lot15', 775, 625, 1, 0, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot15', 812, 625, 1, 0, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot15', 849, 625, 1, 0, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot15', 886, 625, 1, 0, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot15', 923, 625, 1, 0, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot15', 960, 625, 1, 0, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot15', 997, 625, 1, 0, 1, type: SpaceType.handicapL),
    // ...tempRow('Lot15', 1022, 625, 1, 0, 1, type: SpaceType.handicap),
    // ...tempRow('Lot15', 740, 465, 17, 0, 2), //4
    // ...tempRow('Lot15', 740, 300, 17, 0, 2), //5
    // ...tempRow('Lot15', 100, 125, 18, 0, 0), //6R
    // ...tempRow('Lot15', 100, 285, 8, 0, 1), //7R
    // ...tempRow('Lot15', 350, 285, 8, 0, 1), //8R
    // ...tempRow('Lot15', 100, 285, 18, 0, 0), //9R
    // ...tempRow('Lot15', 100, 460, 8, 0, 1), //10R
    // ...tempRow('Lot15', 350, 460, 8, 0, 1), //11R
    // ...tempRow('Lot15', 100, 460, 18, 0, 0), //12R
    // ...tempRow('Lot15', 100, 620, 8, 0, 1), //13R
    // ...tempRow('Lot15', 350, 620, 8, 0, 1), //14R
    // ...tempRow('Lot15', 100, 620, 18, 0, 0), //15R   ends here
    ...tempRowOneArrayPerSpaceRow(
      'Lot9',
      500,
      150,
      67,
      90,
      [16, 39, 40, 41, 42],
      0,
      -0.85,
    ),
    ...tempRowOneArrayPerSpaceRow(
      'Lot9',
      620,
      125,
      60,
      90,
      [
        26,
        35,
        36,
        37,
        38,
      ],
      1,
      -0.93,
    ),

    ...tempRowOneArrayPerSpaceRow(
      'Lot9',
      625,
      150,
      60,
      90,
      [26, 35, 36, 37, 38],
      0,
      -0.95,
    ),

    ...tempRowOneArrayPerSpaceRow(
      'Lot9',
      750,
      80,
      44,
      90,
      [
        0,
        26,
        27,
        28,
        29,
        30,
        31,
        32,
        // 33,
        // 34,
        45,
        46,
        47,
        48,
        49,
        50,
        51,
        52,
        53,
        54,
        55,
        56,
      ],
      1,
      -1.00,
    ),
    ...tempRow('Lot9', 1415, 1280, 1, 34, 1, type: SpaceType.handicapR),
    ...tempRow('Lot9', 1385, 1259, 1, 35, 1, type: SpaceType.handicap),
    ...tempRow('Lot9', 1370, 1246, 1, 36, 1),
    ...tempRow('Lot9', 1350, 1236, 1, 37, 1, type: SpaceType.handicapR),
    ...tempRow('Lot9', 1320, 1215, 1, 38, 1, type: SpaceType.handicap),
    ...tempRow('Lot9', 1305, 1202, 1, 39, 1, type: SpaceType.handicapR),
    ...tempRow('Lot9', 1275, 1181, 1, 40, 1, type: SpaceType.handicap),
    ...tempRow('Lot9', 1260, 1168, 1, 41, 1),
    ...tempRow('Lot9', 1240, 1153, 1, 42, 1, type: SpaceType.handicapR),
    ...tempRow('Lot9', 1210, 1130, 1, 43, 1, type: SpaceType.handicap),
       ...tempRowOneArrayPerSpaceRow(
        'Lot10',
        100,
        170,
        50,
        60,
        [
          3,
          4,
          5,
          6,
          15,
          16,
          17,
          18,
          19,
          23,
          24,
          25,
          26,
          27,
          28,
          29,
          30,
          31,
          32,
          42,
          43,
          44,
          50,
          51,
          52,
          53,
          54,
          55,
          56,
          57
        ],
        0,
        0.50),
    ...tempRowOneArrayPerSpaceRow(
        'Lot10',
        280,
        210,
        69,
        60,
        [
          47,
          48,
          49,
          50,
          51,
          52,
          53,
          54,
          55,
        ],
        0,
        0.53),
    ...tempRowOneArrayPerSpaceRow(
        'Lot10',
        270,
        190,
        69,
        60,
        [
          47,
          48,
          49,
          50,
          51,
          52,
          53,
          54,
          55,
        ],
        1,
        0.52),

    ...tempRowOneArrayPerSpaceRow(
        'Lot10',
        410,
        20,
        67,
        60,
        [
          
          53,
          54,
          55,
          56,
          57,
          58,
          59,
          60,
          61,
          62,
          63,
          64,
          65,
          66,
          67,
          68,
          69,
          70,
          71,
          72,
          73,
        ],
        0,
        0.47),
    ...tempRow('Lot10', 805, 1770, 1, 95, 0, type: SpaceType.handicapL),
    ...tempRow('Lot10', 806, 1745, 1, 94.5, 0, type: SpaceType.handicap),
    ...tempRow('Lot10', 811, 1710, 1, 94, 0, type: SpaceType.handicapL),
    ...tempRow('Lot10', 813, 1687, 1, 93.5, 0, type: SpaceType.handicap),
    ...tempRow('Lot10', 811, 1655, 1, 93, 0, type: SpaceType.handicapL),
    ...tempRow('Lot10', 813, 1629, 1, 92.5, 0, type: SpaceType.handicap),
    ...tempRow('Lot10', 815, 1595, 1, 94, 0, type: SpaceType.handicapL),
    ...tempRow('Lot10', 814, 1570, 1, 93.5, 0, type: SpaceType.handicap),
  ]; // added to firestore @ 10/17/22
  ParkingLot? selectedLot;
  List<ParkingLot> parkingLots = [];
  List<ParkingSpace> parkingSpaces = [];

// run when change in parking lot data
  onParkingLotsChanged(List<ParkingLot> newData) {
    parkingLots = newData + tempLots;
    notifyListeners();
  }

// run when change in parking space data
  onParkingSpacesChanged(List<ParkingSpace> newData) {
    parkingSpaces = newData + tempSpaces;
    notifyListeners();
  }

  void setLot(ParkingLot? lot) {
    selectedLot != lot ? selectedLot = lot : selectedLot = null;
    notifyListeners();
  }

  ParkingLot getLotByName(String name) {
    return parkingLots.where((element) => element.name == name).first;
  }
}
