import 'package:patriots_parking/models/parking_lot.dart';

import 'models/slot.dart';

ParkingLot test2 = const ParkingLot(
  name: "Test2",
  width: 320,
  height: 310,
  slots: [],
);

ParkingLot parkingLotTest = const ParkingLot(
  name: "Test",
  width: 320,
  height: 310,
  slots: [
    Slot(
      positionX: 10,
      positionY: 10,
      orientation: 0,
      open: true,
    ),
    Slot(
      positionX: 60,
      positionY: 10,
      orientation: 0,
      open: true,
    ),
    Slot(
      positionX: 110,
      positionY: 10,
      orientation: 0,
      open: true,
    ),
    Slot(
      positionX: 160,
      positionY: 10,
      orientation: 0,
      open: true,
    ),
    Slot(
      positionX: 210,
      positionY: 10,
      orientation: 0,
      open: true,
    ),
    Slot(
      positionX: 260,
      positionY: 10,
      orientation: 0,
      open: true,
    ),
    Slot(
      positionX: -40,
      positionY: 300,
      orientation: 180,
      open: true,
    ),
    Slot(
      positionX: 10,
      positionY: 300,
      orientation: 180,
      open: true,
    ),
    Slot(
      positionX: 60,
      positionY: 300,
      orientation: 180,
      open: true,
    ),
    Slot(
      positionX: 110,
      positionY: 300,
      orientation: 180,
      open: true,
    ),
    Slot(
      positionX: 160,
      positionY: 300,
      orientation: 180,
      open: true,
    ),
    Slot(
      positionX: 210,
      positionY: 300,
      orientation: 180,
      open: true,
    ),
  ],
);
