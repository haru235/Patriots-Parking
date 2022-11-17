import 'package:patriots_parking/resources/documentcreate.dart';
import 'package:patriots_parking/resources/lot_methods.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:patriots_parking/models/Statistical_Data.dart';

List<ParkingLot> tempLots = [
  const ParkingLot(
    name: 'Lot1',
    width: 700,
    height: 700,
    buttonData: [
      [622, 639, 20, 15, -35],
      [629, 635],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot2',
    width: 1500,
    height: 1500,
    buttonData: [
      [707, 591, 45, 20, -25],
      [725, 587],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot5',
    width: 1500,
    height: 1500,
    buttonData: [
      [605, 454, 11, 6, 6],
      [616, 455, 11, 7, 36],
      [624.5, 461.5, 11, 7, 66],
      [629, 471.5, 11, 7, 96],
      [628, 482, 11, 7, 126],
      [621.5, 491, 11, 6, 156],
      [624, 480],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    height: 1000,
    width: 2500,
    name: 'Lot6',
    buttonData: [
      [661, 352, 42, 70, -25],
      [679, 419, 54, 64, -25],
      [707, 414],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot7',
    width: 2800,
    height: 1500,
    buttonData: [
      [526, 265, 60, 13, -15],
      [580, 238, 30, 24, 0],
      [610, 238, 30, 24, 10],
      [639, 243, 30, 24, 15],
      [667, 251, 40, 24, 30],
      [630, 248],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    height: 1000,
    width: 2500,
    name: 'Lot8',
    buttonData: [
      [455, 315, 82, 35, -15],
      [530, 295, 93, 22, -12],
      [498, 316],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    //To Test new method to draw spaces rows with gaps
    name: 'Lot9',
    width: 2000,
    height: 2000,
    buttonData: [
      [378, 360, 10, 26, -60],
      [383, 351.5, 20, 25, -40],
      [398, 339, 12, 25, -30],
      [408, 333, 20, 25, -20],
      [427, 326, 10, 26, 0],
      [406, 342],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot10',
    width: 1200,
    height: 2200,
    buttonData: [
      [343, 487, 30, 34, 12],
      [338, 515, 30, 30, 22],
      [343, 567, 30, 18, -137],
      [277, 577, 60, 30, -35],
      [330, 544],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot11',
    width: 1,
    height: 1,
    buttonData: [
      [463, 215, 30, 15, -20],
      [491, 205, 33, 14, 40],
      [471, 212],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot12',
    width: 1,
    height: 1,
    buttonData: [
      [148, 498, 53, 15, -80],
      [151, 474],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot13',
    width: 1,
    height: 1,
    buttonData: [
      [96, 469, 42, 15, 10],
      [109, 475],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot14',
    width: 2000, //changed to 2000 11/2/2022
    height: 1000,
    buttonData: [
      [120, 525, 88, 41, 10],
      [206, 540, 62, 45, 35],
      [170, 549],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot15',
    width: 1300,
    height: 1000,
    buttonData: [
      [602, 675, 55, 43, -35],
      [620, 683, 52, 100, -6],
      [643, 702],
    ],
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
  ), //10/16/2022 added lot15 parkinglot
  const ParkingLot(
    name: 'Lot16',
    width: 1500,
    height: 1500,
    buttonData: [
      [821, 663, 45, 20, -25],
      [837, 657],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot17',
    width: 1500,
    height: 1500,
    buttonData: [
      [575, 657, 42, 14, -35],
      [589, 645],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot18',
    width: 700,
    height: 800,
    buttonData: [
      [439, 685, 43, 43, 0],
      [453, 701],
    ],
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
    name: 'G1',
    width: 1,
    height: 1,
    buttonData: [
      [411, 735, 71, 34, 0],
      [440, 746],
    ],
    roadPath: [],
  ),
  const ParkingLot(
    name: 'Lot20',
    width: 1,
    height: 1,
    buttonData: [
      [43, 732, 57, 15, -79],
      [47, 704],
    ],
    roadPath: [],
  ),
];
List<StatisticalData> tempData = [
  StatisticalData(
    available: 50,
    total: 50,
    occupied: 0,
    parkingLotName: 'Lot18',
  ),
  StatisticalData(
    available: 80,
    occupied: 0,
    total: 80,
    parkingLotName: 'Lot15',
  )
];
// temp parking lots for testing without firebase
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
  ...tempRow('Lot9', 1240, 1150, 1, 42, 1, type: SpaceType.handicapR),
  ...tempRow('Lot9', 1215, 1125, 1, 43, 1, type: SpaceType.handicap),

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
    x: 370,
    y: 20,
    count: 67,
    direction: 60,
    side: 1,
    fixedR: 0.45,
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
  ...tempRow('Lot10', 785, 1798, 1, 93, 1, type: SpaceType.handicapR),
  ...tempRow('Lot10', 787, 1763, 1, 92, 1, type: SpaceType.handicap),
  ...tempRow('Lot10', 788, 1738, 1, 91, 1, type: SpaceType.handicapR),
  ...tempRow('Lot10', 790, 1703, 1, 90, 1, type: SpaceType.handicap),
  ...tempRow('Lot10', 791, 1678, 1, 89, 1, type: SpaceType.handicapR),
  ...tempRow('Lot10', 792, 1643, 1, 88, 1, type: SpaceType.handicap),
  ...tempRow('Lot10', 793, 1618, 1, 87, 1, type: SpaceType.handicapL),
  ...tempRow('Lot10', 792, 1585, 1, 86, 1, type: SpaceType.handicapR),

  //TODO switch to createSpaceRow

  ...createSpaceRow(
    //Fixed conflict, data for lot14 had different parameter order, 11/3/2022
    lot: 'Lot14',
    x: 975,
    y: 700,
    count: 24,
    direction: 0,
    side: 1,
    fixedR: -1.0,
    gaps: [15, 16],
  ),
  ...tempRow(
    'Lot14',
    325,
    700,
    10,
    0,
    1,
  ),
  ...createSpaceRow(
    lot: 'Lot14',
    x: 1000,
    y: 500,
    count: 14,
    direction: 0,
    side: 0,
    fixedR: -1.5,
    gaps: [6, 7],
  ),
  ...createSpaceRow(
    lot: 'Lot14',
    x: 675,
    y: 700,
    count: 10,
    direction: 0,
    side: 1,
    fixedR: 0,
    gaps: [],
  ),
  ...createSpaceRow(
    lot: 'Lot14',
    x: 700,
    y: 500,
    count: 14,
    direction: 0,
    side: 0,
    fixedR: 0,
    gaps: [],
  ),
  ...tempRow('Lot14', 300, 500, 8, 0, 0),
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
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1750,
    y: 1400,
    count: 27,
    direction: 10,
    side: 1,
    fixedR: -0.80,
    gaps: [],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1750,
    y: 1200,
    count: 25,
    direction: 10,
    side: 0,
    fixedR: -0.80,
    gaps: [
      4,
      5,
    ],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1700,
    y: 1130,
    count: 28,
    direction: 10,
    side: 0,
    fixedR: -0.75,
    gaps: [6, 7],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1710,
    y: 1000,
    count: 32,
    direction: 10,
    side: 0,
    fixedR: -0.75,
    gaps: [6, 7],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1000,
    y: 700,
    count: 53,
    direction: 30,
    side: 0,
    fixedR: -0.70,
    gaps: [12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31, 48, 49, 50],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1035,
    y: 600,
    count: 39,
    direction: 30,
    side: 1,
    fixedR: -0.72,
    gaps: [
      3,
      4,
      12,
      13,
      14,
      15,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
      40,
      43,
      44,
      45,
      46,
      47,
      48
    ],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1060,
    y: 530,
    count: 41,
    direction: 30,
    side: 1,
    fixedR: -0.72,
    gaps: [
      12,
      13,
      14,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
      42,
      43,
      44,
      45,
      46,
      47,
    ],
  ),
  ...tempRow('Lot7', 180, 80, 31, 30, 0),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1035,
    y: 350,
    count: 48,
    direction: 32,
    side: 1,
    fixedR: -0.72,
    gaps: [23, 24, 25, 26, 35, 36],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 305,
    y: 30,
    count: 19,
    direction: 31,
    side: 1,
    fixedR: 0.00,
    gaps: [
      12,
      13,
      14,
      15,
      16,
      17,
      18,
    ],
  ),
  ...tempRow('Lot7', 2365, 625, 1, -8, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2385, 620, 1, -9, 1, type: SpaceType.handicap),
  ...tempRow('Lot7', 2415, 615, 1, -11, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2435, 610, 1, -12, 1, type: SpaceType.handicap),
  ...tempRow('Lot7', 2465, 605, 1, -12, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2484, 596, 1, -12, 1, type: SpaceType.handicap),
  ...tempRow('Lot7', 2510, 590, 1, -12, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2530, 583, 1, -12, 1, type: SpaceType.handicap),

  ...createSpaceRow(
      lot: 'Lot8',
      x: 100,
      y: 600,
      count: 56,
      direction: 0,
      side: 1,
      gaps: [39, 40, 41, 42],
      fixedR: 0),
  ...createSpaceRow(
      lot: 'Lot8',
      x: 125,
      y: 425,
      count: 53,
      direction: 0,
      side: 0,
      gaps: [39, 40, 41, 42],
      fixedR: 0),
  ...createSpaceRow(
      lot: 'Lot8',
      x: 100,
      y: 425,
      count: 53,
      direction: 0,
      side: 1,
      gaps: [39, 40, 41, 42],
      fixedR: 0),
  ...createSpaceRow(
      lot: 'Lot8',
      x: 100,
      y: 250,
      count: 37,
      direction: 0,
      side: 0,
      gaps: [
        6,
        7,
        8,
        9,
        10,
        11,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        41,
        42,
        43,
        53,
        54,
        55,
        56,
        57,
        58
      ],
      fixedR: 0),
  ...createSpaceRow(
      lot: 'Lot8',
      x: 1800,
      y: 650,
      count: 5,
      direction: 0,
      side: 0,
      gaps: [],
      fixedR: 0),
  ...createSpaceRow(
      lot: 'Lot8',
      x: 1775,
      y: 650,
      count: 5,
      direction: 0,
      side: 1,
      gaps: [],
      fixedR: 0),
  ...createSpaceRow(
      lot: 'Lot8',
      x: 1750,
      y: 425,
      count: 9,
      direction: 0,
      side: 0,
      gaps: [],
      fixedR: 0),

  ...createSpaceRow(
      lot: 'Lot6',
      x: 250,
      y: 700,
      count: 63,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: [9, 10, 11, 12]),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 350,
      y: 500,
      count: 51,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: [
        6,
        7,
        8,
        9,
        22,
        23,
        24,
        25,
        41,
        42,
        43,
      ]),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 325,
      y: 500,
      count: 51,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: [
        6,
        7,
        8,
        9,
        22,
        23,
        24,
        25,
        41,
        42,
        43,
      ]),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 350,
      y: 300,
      count: 56,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: [7, 8, 9, 25, 36, 37, 38, 39]),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 325,
      y: 200,
      count: 28,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: [7, 8, 9, 10, 11, 12, 13, 25]),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 725,
      y: 15,
      count: 14,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: [0, 1, 2, 3, 4, 5, 6, 7, 8, 10]),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 215,
      y: 0,
      count: 12,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: [12, 13, 14, 15, 16, 17, 18, 19, 20]),
  ...createSpaceRow(
      lot: 'Lot5',
      x: 500,
      y: 500,
      count: 22,
      direction: 30,
      side: 0,
      fixedR: 4.5,
      gaps: []),
  ...tempRow('Lot5', 523, 955, 1, 126, 1, type: SpaceType.handicapL),
  ...tempRow('Lot5', 510, 975, 1, 129, 1, type: SpaceType.handicap),
  ...createSpaceRow(
      lot: 'Lot2',
      x: 500,
      y: 850,
      count: 21,
      direction: 10,
      side: 1,
      fixedR: 0,
      gaps: [12]),
  ...createSpaceRow(
      lot: 'Lot2',
      x: 500,
      y: 675,
      count: 25,
      direction: 10,
      side: 0,
      fixedR: 0,
      gaps: [1]),
  ...createSpaceRow(
      lot: 'Lot2',
      x: 525,
      y: 680,
      count: 24,
      direction: 10,
      side: 1,
      fixedR: 0,
      gaps: []),
  ...createSpaceRow(
      lot: 'Lot2',
      x: 550,
      y: 510,
      count: 29,
      direction: 10,
      side: 0,
      fixedR: 0,
      gaps: []),
  ...createSpaceRow(
      lot: 'Lot2',
      x: 550,
      y: 490,
      count: 16,
      direction: 10,
      side: 1,
      fixedR: 0,
      gaps: []),

  ...createSpaceRow(
      lot: 'Lot16',
      x: 250,
      y: 490,
      count: 42,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: [16]),
  ...createSpaceRow(
      lot: 'Lot16',
      x: 375,
      y: 675,
      count: 36,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: [10]),
  
    ...createSpaceRow(
      lot: 'Lot17',
      x: 300,
      y: 800,
      count: 18,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: [8]),
  ...createSpaceRow(
      lot: 'Lot17',
      x: 325,
      y: 615,
      count: 16,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: []),
  
    ...tempRow('Lot1', 300, 300, 6, 0, 0),
]; // added to firestore @ 10/17/22
