import 'package:patriots_parking/models/parking_lot.dart';

import 'models/slot.dart';

//temporary: we will be retrieving this from the database.
List<Slot> slots = const [
  Slot(
    parkingLot: 'Test0',
    positionX: 10,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 60,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 110,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 160,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 210,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 260,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: -40,
    positionY: 300,
    orientation: 180,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 10,
    positionY: 300,
    orientation: 180,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 60,
    positionY: 300,
    orientation: 180,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 110,
    positionY: 300,
    orientation: 180,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 160,
    positionY: 300,
    orientation: 180,
    open: true,
  ),
  Slot(
    parkingLot: 'Test0',
    positionX: 210,
    positionY: 300,
    orientation: 180,
    open: true,
  ),
  Slot(
    parkingLot: 'Test1',
    positionX: 10,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
  Slot(
    parkingLot: 'Test2',
    positionX: 10,
    positionY: 10,
    orientation: 0,
    open: true,
  ),
];

List<ParkingLot> parkingLots = const [
  ParkingLot(
    name: "Test0",
    width: 320,
    height: 310,
  ),
  ParkingLot(
    name: "Test1",
    width: 310,
    height: 320,
  ),
  ParkingLot(
    name: "Test2",
    width: 400,
    height: 310,
  ),
];
