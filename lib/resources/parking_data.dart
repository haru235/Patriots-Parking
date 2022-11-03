import 'package:patriots_parking/resources/documentcreate.dart';
import 'package:patriots_parking/resources/lot_methods.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';

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
  const ParkingLot(
    //To Test new method to draw spaces rows with gaps
    name: 'Lot9',
    width: 2000,
    height: 2000,
    roadPath: [[]],
  ),
  const ParkingLot(
      name: 'Lot14',
      width: 2000,  //changed to 2000 11/2/2022
      height: 1000,
      roadPath: []), //need to update old space data, new method will be used to add the spaces for lot14 and lot10
  const ParkingLot(
      name: 'Lot10',
      width: 1200,
      height: 2200,
      roadPath: []), //spaces will be added later to github
  //10/16/2022 added lot15 parkinglot
]; // temp parking lots for testing without firebase
List<ParkingSpace> tempSpaces = [
  // added to firestore @ 10/17/22
  //...tempRow('Lot18', 175, 100, 5, 0, 0),
  //...tempRow('Lot18', 125, 150, 5, 90, 1),
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
  ...createSpaceRow(
    lot: 'Lot9',
    x: 500,
    y: 150,
    count: 67,
    direction: 90,
    side: 0,
    fixedR: -0.85,
    gaps: [16, 39, 40, 41, 42],
  ),
  ...createSpaceRow(
    lot: 'Lot9',
    x: 620,
    y: 125,
    count: 60,
    direction: 90,
    side: 1,
    fixedR: -0.93,
    gaps: [26, 35, 36, 37, 38],
  ),

  ...createSpaceRow(
    lot: 'Lot9',
    x: 625,
    y: 150,
    count: 60,
    direction: 90,
    side: 0,
    fixedR: -0.95,
    gaps: [26, 35, 36, 37, 38],
  ),

  ...createSpaceRow(
    lot: 'Lot9',
    x: 750,
    y: 80,
    count: 44,
    direction: 90,
    side: 1,
    fixedR: -1.00,
    gaps: [
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
  ),
  //TODO switch to createSpaceRow
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
  ...createSpaceRow(
    lot: 'Lot10',
    x: 100,
    y: 170,
    count: 50,
    direction: 60,
    side: 0,
    fixedR: 0.50,
    gaps: [
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
      57,
    ],
  ),
  ...createSpaceRow(
    lot: 'Lot10',
    x: 280,
    y: 210,
    count: 69,
    direction: 60,
    side: 0,
    fixedR: 0.53,
    gaps: [
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
  ),
  ...createSpaceRow(
    lot: 'Lot10',
    x: 270,
    y: 190,
    count: 69,
    direction: 60,
    side: 1,
    fixedR: 0.52,
    gaps: [
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
  ),

  ...createSpaceRow(
    lot: 'Lot10',
    x: 410,
    y: 20,
    count: 67,
    direction: 60,
    side: 1,
    fixedR: -0.60,
    gaps: [
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
  ),
  //TODO switch to createSpaceRow
  ...tempRow('Lot9', 1030, 1695, 1, 90, 1, type: SpaceType.handicapR),
  ...tempRow('Lot9', 1010, 1660, 1, 90, 1, type: SpaceType.handicapL),
  ...tempRow('Lot9', 988, 1625, 1, 90, 1),
  ...tempRow('Lot9', 967, 1600, 1, 90, 1, type: SpaceType.handicapR),
  ...tempRow('Lot9', 945, 1565, 1, 90, 1, type: SpaceType.handicapL),
  ...tempRow('Lot9', 924, 1530, 1, 90, 1, type: SpaceType.handicapR),
  ...tempRow('Lot9', 904, 1495, 1, 90, 1, type: SpaceType.handicapL),
  ...tempRow('Lot9', 884, 1460, 1, 90, 1),
  ...tempRow('Lot9', 864, 1435, 1, 90, 1, type: SpaceType.handicapR),
  ...tempRow('Lot9', 844, 1400, 1, 90, 1, type: SpaceType.handicapL),
  
    ...createSpaceRow('Lot14', 975, 700, 24, 0, [15, 16], 1, -1.0),  //11/2/2022
    ...createSpaceRow('Lot14', 1000, 500, 14, 0, [6, 7], 0, -1.5),
    ...createSpaceRow('Lot14', 675, 700, 10, 0, [], 1, 0),
    ...createSpaceRow('Lot14', 700, 500, 14, 0, [], 0, 0),
    ...tempRow(
      'Lot14',
      325,
      700,
      10,
      0,
      1,
    ),
    ...tempRow('Lot14', 300, 500, 8, 0, 0),  //11/2/2022
    ...tempRow('Lot14', 300, 700, 1, 0, 1, type: SpaceType.handicapL),
    ...tempRow('Lot14', 500, 500, 1, 0, 0, type: SpaceType.handicapR),
    ...tempRow(
      'Lot14',
      535,
      500,
      2,
      0,
      0,
    ),
    ...tempRow('Lot14', 500, 500, 1, 0, 0, type: SpaceType.handicapR),
    ...tempRow('Lot14', 1385, 413, 1, 337, 0, type: SpaceType.handicapR),
    ...tempRow('Lot14', 1418, 400, 1, 335, 0, type: SpaceType.handicapL),
    ...tempRow('Lot14', 1450, 384, 1, 333, 0, type: SpaceType.handicapL),
    ...tempRow('Lot14', 1480, 366, 1, 330, 0, type: SpaceType.handicapL),
]; // added to firestore @ 10/17/22
