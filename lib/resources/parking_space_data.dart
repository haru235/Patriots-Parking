import 'package:patriots_parking/resources/lot_methods.dart';
import 'package:patriots_parking/models/parking_space.dart';

// uploaded to database 11/27/22
// list of spaces generated for parking lot layout.
// not nneded after uploaded to firebase, but keep for backup
List<ParkingSpace> tempSpaces = [
  ...tempRow('Lot18', 175, 100, 5, 0, 0),
  ...tempRow('Lot18', 125, 150, 5, 90, 1),
  ...tempRow('Lot18', 125, 275, 1, 90, 1, type: SpaceType.handicap),
  ...tempRow('Lot18', 125, 310, 1, 90, 1, type: SpaceType.handicapR),
  ...tempRow('Lot18', 125, 345, 1, 90, 1, type: SpaceType.handicapR),
  ...tempRow('Lot18', 125, 380, 1, 90, 1, type: SpaceType.handicapL),
  ...tempRow('Lot18', 125, 405, 1, 90, 1, type: SpaceType.handicap),
  ...tempRow('Lot18', 425, 100, 10, 90, 2),
  ...tempRow('Lot18', 425, 375, 11, 90, 0),
  ...tempRow('Lot18', 425, 375, 12, 90, 1),
  ...tempRow('Lot18', 575, 25, 8, 90, 0),
  ...tempRow('Lot18', 575, 250, 9, 90, 0),
  ...tempRow('Lot18', 575, 500, 8, 90, 0),
  ...tempRow('Lot18', 275, 225, 8, 90, 1),
  ...tempRow('Lot18', 275, 225, 7, 90, 0),
  ...tempRow('Lot18', 275, 768, 5, 18, 1),
  ...tempRow('Lot15', -25, 785, 26, 0, 1),
  ...tempRow('Lot15', 750, 125, 17, 0, 0), //2
  ...tempRow('Lot15', 1275, 175, 16, 90, 0), //3
  ...tempRow('Lot15', 775, 625, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot15', 812, 625, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot15', 849, 625, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot15', 886, 625, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot15', 923, 625, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot15', 960, 625, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot15', 997, 625, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot15', 1022, 625, 1, 0, 1, type: SpaceType.handicap),
  ...tempRow('Lot15', 740, 465, 17, 0, 2), //4
  ...tempRow('Lot15', 740, 300, 17, 0, 2), //5
  ...tempRow('Lot15', 100, 125, 18, 0, 0), //6R
  ...tempRow('Lot15', 100, 285, 8, 0, 1), //7R
  ...tempRow('Lot15', 350, 285, 8, 0, 1), //8R
  ...tempRow('Lot15', 100, 285, 18, 0, 0), //9R
  ...tempRow('Lot15', 100, 460, 8, 0, 1), //10R
  ...tempRow('Lot15', 350, 460, 8, 0, 1), //11R
  ...tempRow('Lot15', 100, 460, 18, 0, 0), //12R
  ...tempRow('Lot15', 100, 620, 8, 0, 1), //13R
  ...tempRow('Lot15', 350, 620, 8, 0, 1), //14R
  ...tempRow('Lot15', 100, 620, 18, 0, 0), //15R   ends here
  ...createSpaceRow(
    lot: 'Lot9',
    x: 535,
    y: 150,
    count: 67,
    direction: 90,
    side: 0,
    fixedR: -0.92,
    gaps: [16, 39, 40, 41, 42],
  ),
  ...createSpaceRow(
    lot: 'Lot9',
    x: 650,
    y: 125,
    count: 60,
    direction: 90,
    side: 1,
    fixedR: -0.97,
    gaps: [26, 35, 36, 37, 38],
  ),
  ...createSpaceRow(
    lot: 'Lot9',
    x: 650,
    y: 150,
    count: 60,
    direction: 90,
    side: 0,
    fixedR: -0.995,
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
    x: 185,
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
    x: 330,
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
    x: 320,
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
    y: 1375,
    count: 27,
    direction: 10,
    side: 1,
    fixedR: -0.80,
    gaps: [],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1750,
    y: 1210,
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
    y: 1010,
    count: 32,
    direction: 10,
    side: 0,
    fixedR: -0.73,
    gaps: [6, 7],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1000,
    y: 682,
    count: 53,
    direction: 30,
    side: 0,
    fixedR: -0.70,
    gaps: [12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31, 48, 49, 50],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1035,
    y: 644,
    count: 39,
    direction: 30,
    side: 1,
    fixedR: -0.73,
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
    y: 580,
    count: 41,
    direction: 30,
    side: 1,
    fixedR: -0.74,
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
  ...tempRow('Lot7', 180, 60, 31, 30, 0),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 1035,
    y: 445,
    count: 48,
    direction: 32,
    side: 1,
    fixedR: -0.76,
    gaps: [23, 24, 25, 26, 35, 36],
  ),
  ...createSpaceRow(
    lot: 'Lot7',
    x: 305,
    y: 50,
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
  ...tempRow('Lot7', 2365, 693, 1, -8, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2385, 688, 1, -9, 1, type: SpaceType.handicap),
  ...tempRow('Lot7', 2415, 683, 1, -11, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2435, 678, 1, -12, 1, type: SpaceType.handicap),
  ...tempRow('Lot7', 2465, 673, 1, -12, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2484, 666, 1, -12, 1, type: SpaceType.handicap),
  ...tempRow('Lot7', 2510, 659, 1, -12, 1, type: SpaceType.handicapL),
  ...tempRow('Lot7', 2530, 652, 1, -12, 1, type: SpaceType.handicap),
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
        22,
        //41,
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
  ...tempRow('Lot8', 475, 250, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 505, 250, 1, 0, 0, type: SpaceType.handicap),
  ...tempRow('Lot8', 530, 250, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 560, 250, 1, 0, 0, type: SpaceType.handicap),
  ...tempRow('Lot8', 585, 250, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 620, 250, 1, 0, 0, type: SpaceType.handicap),
  ...tempRow('Lot8', 645, 250, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 1400, 250, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 1435, 250, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot8', 1470, 250, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 1505, 250, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot8', 1540, 250, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 1575, 250, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot8', 1675, 325, 1, 90, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 1675, 360, 1, 90, 0, type: SpaceType.handicapL),
  ...tempRow('Lot8', 1675, 395, 1, 90, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 1675, 430, 1, 90, 0, type: SpaceType.handicapL),
  ...tempRow('Lot8', 1675, 465, 1, 90, 0, type: SpaceType.handicapR),
  ...tempRow('Lot8', 1675, 500, 1, 90, 0, type: SpaceType.handicapL),
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
  ...tempRow('Lot6', 125, 135, 1, 82, 1, type: SpaceType.handicapR),
  ...tempRow('Lot6', 130, 170, 1, 82, 1, type: SpaceType.handicapL),
  ...tempRow('Lot6', 135, 205, 1, 82, 1, type: SpaceType.handicapR),
  ...tempRow('Lot6', 140, 240, 1, 82, 1, type: SpaceType.handicapL),
  ...tempRow('Lot6', 145, 275, 1, 82, 1, type: SpaceType.handicapR),
  ...tempRow('Lot6', 150, 310, 1, 82, 1, type: SpaceType.handicapL),
  ...tempRow('Lot6', 155, 345, 1, 82, 1, type: SpaceType.handicapR),
  ...tempRow('Lot6', 160, 380, 1, 82, 1, type: SpaceType.handicapL),
  ...tempRow('Lot6', 165, 415, 1, 82, 1, type: SpaceType.handicapR),
  ...tempRow('Lot6', 170, 450, 1, 82, 1, type: SpaceType.handicapL),
  ...tempRow('Lot6', 173, 475, 1, 82, 1, type: SpaceType.handicap),
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
  ...tempRow('Lot6', 315, 300, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot6', 290, 300, 1, 0, 0, type: SpaceType.handicap),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 325,
      y: 300,
      count: 28,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: [7, 8, 9, 10, 11, 12, 13, 25]),
  ...tempRow('Lot6', 325, 300, 1, 0, 1, type: SpaceType.handicapR),
  ...tempRow('Lot6', 290, 300, 1, 0, 1, type: SpaceType.handicap),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 725,
      y: 75,
      count: 14,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: [0, 1, 2, 3, 4, 5, 6, 7, 8, 10]),
  ...tempRow('Lot6', 915, 75, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot6', 890, 75, 1, 0, 0, type: SpaceType.handicap),
  ...tempRow('Lot6', 855, 75, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot6', 830, 75, 1, 0, 0, type: SpaceType.handicap),
  ...tempRow('Lot6', 795, 75, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot6', 770, 75, 1, 0, 0, type: SpaceType.handicap),
  ...tempRow('Lot6', 735, 75, 1, 0, 0, type: SpaceType.handicapL),
  ...tempRow('Lot6', 710, 75, 1, 0, 0, type: SpaceType.handicap),
  ...createSpaceRow(
      lot: 'Lot6',
      x: 215,
      y: 60,
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
  ...tempRow('Lot2', 978, 565, 1, 10, 1, type: SpaceType.handicapL),
  ...tempRow('Lot2', 1003, 569, 1, 10, 1, type: SpaceType.handicap),
  ...tempRow('Lot2', 1038, 574, 1, 10, 1, type: SpaceType.handicapL),
  ...tempRow('Lot2', 1063, 578, 1, 10, 1, type: SpaceType.handicap),
  ...tempRow('Lot2', 1098, 585, 1, 10, 1, type: SpaceType.handicapL),
  ...tempRow('Lot2', 1123, 590, 1, 10, 1, type: SpaceType.handicap),
  ...tempRow('Lot2', 1158, 595, 1, 10, 1, type: SpaceType.handicapL),
  ...tempRow('Lot2', 1183, 600, 1, 10, 1, type: SpaceType.handicap),
  ...tempRow('Lot2', 1218, 605, 1, 10, 1, type: SpaceType.handicapL),
  ...tempRow('Lot2', 1243, 610, 1, 10, 1, type: SpaceType.handicap),
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
  ...tempRow('Lot16', 365, 675, 1, 0, 1, type: SpaceType.handicapR),
  ...tempRow('Lot16', 330, 675, 1, 0, 1, type: SpaceType.handicapR),
  ...tempRow('Lot16', 295, 675, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot16', 260, 675, 1, 0, 1, type: SpaceType.handicapL),
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
  ...tempRow('Lot17', 300, 800, 1, 0, 1, type: SpaceType.handicapR),
  ...tempRow('Lot17', 275, 800, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot17', 265, 615, 1, 0, 0, type: SpaceType.handicapR),
  ...tempRow('Lot17', 300, 615, 1, 0, 0, type: SpaceType.handicap),
  ...tempRow('Lot1', 300, 300, 6, 0, 0),
  ...createSpaceRow(
      lot: 'Lot11',
      x: 300,
      y: 500,
      count: 17,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: []),
  ...createSpaceRow(
      lot: 'Lot11',
      x: 275,
      y: 490,
      count: 13,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: []),
  ...createSpaceRow(
      lot: 'Lot11',
      x: 300,
      y: 330,
      count: 8,
      direction: 0,
      side: 0,
      fixedR: 0,
      gaps: []),
  ...createSpaceRow(
      lot: 'Lot11',
      x: 275,
      y: 665,
      count: 10,
      direction: 0,
      side: 1,
      fixedR: 0,
      gaps: []),
  ...tempRow('Lot11', 565, 665, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot11', 610, 665, 1, 0, 1, type: SpaceType.handicapR),
  ...tempRow('Lot11', 655, 665, 1, 0, 1, type: SpaceType.handicapL),
  ...tempRow('Lot11', 700, 665, 1, 0, 1, type: SpaceType.handicapR),
  ...tempRow(
    'Lot11',
    725,
    665,
    1,
    0,
    1,
  ),
  ...tempRow(
    'Lot11',
    750,
    665,
    1,
    0,
    1,
  ),
  ...tempRow(
    'Lot11',
    810,
    650,
    2,
    -45,
    1,
  ),
  ...createSpaceRow(
      lot: 'Lot11',
      x: 165,
      y: 100,
      count: 26,
      direction: 90,
      side: 1,
      fixedR: 0,
      gaps: []),
  ...createSpaceRow(
      lot: 'Lot11',
      x: 350,
      y: 125,
      count: 7,
      direction: 90,
      side: 0,
      fixedR: 0,
      gaps: []),
  ...createSpaceRow(
      lot: 'Lot20',
      x: 800,
      y: 125,
      count: 25,
      direction: 90,
      side: 0,
      fixedR: 0,
      gaps: [
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
      ]),
  ...tempRow('Lot20', 800, 555, 1, 90, 0, type: SpaceType.handicapR),
  ...tempRow('Lot20', 800, 590, 1, 90, 0, type: SpaceType.handicapL),
  ...createSpaceRow(
      lot: 'Lot20',
      x: 625,
      y: 250,
      count: 24,
      direction: 90,
      side: 1,
      fixedR: 0,
      gaps: [11, 12, 13, 16, 17, 18, 19, 20, 21]),
  ...tempRow('Lot20', 625, 605, 1, 90, 1, type: SpaceType.handicapR),
  ...tempRow('Lot20', 625, 568, 1, 90, 1, type: SpaceType.handicapL),
  ...tempRow('Lot12', 400, 200, 1, -60, 1, type: SpaceType.handicapL),
  ...tempRow('Lot12', 400, 235, 1, -60, 1, type: SpaceType.handicapR),
  ...tempRow('Lot12', 400, 270, 1, -60, 1, type: SpaceType.handicapL),
  ...tempRow('Lot12', 400, 305, 1, -60, 1, type: SpaceType.handicapR),
  ...tempRow('Lot12', 400, 340, 1, -60, 1, type: SpaceType.handicapL),
  ...tempRow('Lot13', 100, 200, 3, 0, 0),
  ...tempRow('Lot13', 300, 200, 5, 0, 0),
  ...tempRow('Lot13', 425, 275, 3, 90, 0),
  ...tempRow('Lot13', 65, 200, 1, 0, 0, type: SpaceType.handicapL),
];
