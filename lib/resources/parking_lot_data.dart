import 'package:patriots_parking/models/parking_lot.dart';

// list of parking lots of campus
// ignore: non_constant_identifier_names
List<ParkingLot> UTTLots = const [
  ParkingLot(
    name: 'Lot1',
    width: 700,
    height: 700,
    buttonData: [
      [622, 639, 20, 15, -35],
      [629, 635],
    ],
    roadPath: [
      [0, 320, 750, 290, 800, 380],
      [0, 320, 100, 420],
    ],
  ),
  ParkingLot(
    name: 'Lot2',
    width: 1500,
    height: 1500,
    buttonData: [
      [707, 591, 45, 20, -25],
      [725, 587],
    ],
    roadPath: [
      [470, 745, 1240, 610],
      [520, 913, 1320, 770],
      [600, 1100, 1400, 965],
      [320, 545, 420, 650, 600, 1100],
      [1150, 445, 1450, 900, 1400, 965],
      [550, 1000, 470, 1050],
      [1240, 610, 1260, 550, 1300, 500],
    ],
  ),
  ParkingLot(
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
    roadPath: [
      [440, 475, 760, 740, 440, 980],
      [440, 475, 80, 740, 440, 980],
      [440, 475, 500, 400, 700, 350],
      [440, 980, 490, 1050, 650, 1100],
    ],
  ),
  ParkingLot(
    height: 1000,
    width: 2500,
    name: 'Lot6',
    buttonData: [
      [661, 352, 42, 70, -25],
      [679, 419, 54, 64, -25],
      [707, 414],
    ],
    roadPath: [
      [200, 400, 2200, 400],
      [290, 600, 2200, 600],
      [290, 790, 1315, 790],
      [290, 840, 1315, 840],
      [1315, 840, 1315, 600],
      [
        290,
        400,
        290,
        840,
      ],
      [0, 250, 2500, 250],
      [575, 150, 575, 600],
    ],
  ),
  ParkingLot(
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
    roadPath: [
      [1700, 230, 2050, 130, 2500, 230],
      [1670, 430, 2090, 305, 2650, 470],
      [950, 890, 1770, 390, 2750, 700],
      [1030, 1200, 2000, 700, 2750, 1050],
      [1030, 1040, 1850, 540, 2750, 885],
      [1000, 1020, 250, 1450],
      [1080, 970, 900, 700],
      [1055, 990, 875, 700],
      [1015, 1000, 835, 700],
      [850, 700, 1800, 0],
      [850, 700, 200, 1200],
      [2500, 230, 2650, 470],
      [2650, 470, 2750, 700],
      [350, 1530, 1030, 1200],
      [350, 1530, 300, 1450],
      [1700, 230, 1670, 430],
      [1670, 430, 1670, 625],
      [2750, 700, 2750, 1100],
    ],
  ),
  ParkingLot(
    height: 1000,
    width: 2500,
    name: 'Lot8',
    buttonData: [
      [455, 315, 82, 35, -15],
      [530, 295, 93, 22, -12],
      [498, 316],
    ],
    roadPath: [
      [130, 487, 1620, 487],
      [130, 663, 1620, 663],
      [0, 260, 2300, 200, 2500, 260],
      [125, 260, 125, 663],
      [1175, 260, 1175, 630],
      [1620, 487, 1620, 663],
      [1770, 260, 1770, 460],
      [2000, 460, 1770, 460],
      [2000, 460, 2000, 260],
    ],
  ),
  ParkingLot(
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
    roadPath: [
      [590, 1875, 580, 937, 1530, 445],
      [750, 1875, 810, 970, 1590, 610],
      [450, 1925, 460, 800, 1490, 325],
      [800, 840, 1050, 1040],
      [465, 1875, 740, 1875],
      [1475, 300, 1600, 600],
    ],
  ),
  ParkingLot(
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
    roadPath: [
      [230, 2050, 800, 1040, 555, 40],
      [390, 2125, 950, 1073, 720, 10],
      [0, 1600, 700, 900, 400, 0],
      [320, 80, 705, 0],
      //[500, 100, 705, 60],
      [230, 2050, 380, 2125],
      [
        475,
        715,
        770,
        720,
      ],
      [475, 740, 770, 745],
      [475, 775, 770, 780]
    ],
  ),
  ParkingLot(
    name: 'Lot11',
    width: 1000,
    height: 1000,
    buttonData: [
      [463, 215, 30, 15, -20],
      [491, 205, 33, 14, 40],
      [471, 212],
    ],
    roadPath: [
      [280, 417, 770, 417],
      [280, 250, 280, 875],
      [280, 590, 650, 590],
      [280, 875, 325, 1000],
      [310, 1000, 1000, 417],
      [770, 417, 850, 517],
    ],
  ),
  ParkingLot(
    name: 'Lot12',
    width: 700,
    height: 700,
    buttonData: [
      [148, 498, 53, 15, -80],
      [151, 474],
    ],
    roadPath: [
      [350, 200, 350, 700],
      [350, 200, 250, 200],
      [0, 675, 700, 675],
    ],
  ),
  ParkingLot(
    name: 'Lot13',
    width: 700,
    height: 700,
    buttonData: [
      [96, 469, 42, 15, 10],
      [109, 475],
    ],
    roadPath: [
      [110, 415, 370, 415],
      [110, 395, 370, 395],
      [110, 375, 370, 375],
      [260, 415, 260, 700],
      [0, 550, 700, 550],
      [0, 650, 700, 650],
    ],
  ),
  ParkingLot(
    name: 'Lot14',
    width: 2000, //changed to 2000 11/2/2022
    height: 1000,
    buttonData: [
      [120, 525, 88, 41, 10],
      [206, 540, 62, 45, 35],
      [170, 549],
    ],
    roadPath: [
      [1700, 600, 1825, 500, 1850, 700],
      [1700, 600, 1625, 780, 1850, 700],
      [1675, 600, 1450, 420, 1000, 400],
      [1000, 400, 325, 400],
      [1780, 540, 1810, 470],
      [1810, 470, 1890, 500, 2000, 370],
      [1890, 500, 2000, 800],
      [1810, 470, 1300, 50, 1200, 100],
      [1810, 470, 1200, 250],
      [1200, 95, 0, 95],
      [1200, 250, 0, 250],
      [660, 95, 660, 400]
    ],
  ),
  ParkingLot(
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
  ParkingLot(
    name: 'Lot16',
    width: 1500,
    height: 1500,
    buttonData: [
      [821, 663, 45, 20, -25],
      [837, 657],
    ],
    roadPath: [
      [125, 840, 250, 920, 125, 1000],
      [125, 840, 0, 920, 125, 1000],
      [220, 920, 1500, 920],
      [1500, 300, 1500, 1500],
    ],
  ),
  ParkingLot(
    name: 'Lot17',
    width: 1500,
    height: 1500,
    buttonData: [
      [575, 657, 42, 14, -35],
      [589, 645],
    ],
    roadPath: [
      [150, 800, 30, 870, 150, 950],
      [150, 800, 800, 800],
      [150, 950, 1500, 950],
      [800, 800, 800, 950],
      [150, 800, 100, 700],
      [30, 950, 100, 930, 500, 1200],
    ],
  ),
  ParkingLot(
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
  ParkingLot(
    name: 'G1',
    width: 1,
    height: 1,
    buttonData: [
      [411, 735, 71, 34, 0],
      [440, 746],
    ],
    roadPath: [],
  ),
  ParkingLot(
    name: 'Lot20',
    width: 1200,
    height: 1200,
    buttonData: [
      [43, 732, 57, 15, -79],
      [47, 704],
    ],
    roadPath: [
      [740, 100, 740, 1100],
      [740, 1100, 810, 1200],
      [740, 1100, 580, 1100],
      [740, 500, 580, 500],
      [580, 0, 580, 1200],
    ],
  ),
];
