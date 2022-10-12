import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';

enum SpaceType {
  normal,
  handicap,
  handicapL,
  handicapR,
  motorcycle,
  reserved,
  guest
}

// parking space object
class ParkingSpace extends StatefulWidget {
  final String id;
  final String parkingLot;
  final num positionX;
  final num positionY;
  final num orientation;
  final bool open;
  final bool temp;
  final SpaceType type;
  const ParkingSpace({
    this.id = '',
    required this.parkingLot,
    required this.positionX,
    required this.positionY,
    required this.orientation,
    required this.open,
    this.temp = false,
    this.type = SpaceType.normal,
    Key? key,
  }) : super(key: key);

// convert ParkingSpace to json to send to firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parking lot': parkingLot,
      'x': positionX,
      'y': positionY,
      'orientation': orientation,
      'open': open,
      'type': type.name,
    };
  }

// convert json data from firestore to ParkingSpace
  static ParkingSpace fromJson(Map<String, dynamic> json) {
    return ParkingSpace(
      id: json['id'],
      parkingLot: json['parking lot'],
      positionX: json['x'],
      positionY: json['y'],
      orientation: json['orientation'],
      open: json['open'],
      temp: false,
      type: SpaceType.values.byName(json['type'] ?? 'normal'),
    );
  }

  @override
  State<ParkingSpace> createState() => _ParkingSpaceState();
}

class _ParkingSpaceState extends State<ParkingSpace> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.positionX.toDouble(),
      bottom: widget.positionY.toDouble(),
      child: Transform.rotate(
        origin: Offset(
            widget.type == SpaceType.handicapR
                ? -10
                : widget.type == SpaceType.handicapL
                    ? -10
                    : 0,
            0),
        alignment: Alignment.bottomRight,
        angle: widget.orientation / 180 * pi,
        child: GestureDetector(
          onTap: () => setState(() {
            widget.temp // (HS 10/5/22 @ 1:12AM) temp spaces do not run code
                ? null
                : locator.get<FirestoreMethods>().toggleSpace(widget);
          }),
          child: Container(
            width: 25 +
                (widget.type == SpaceType.handicapL ? 10 : 0) +
                (widget.type == SpaceType.handicapR ? 10 : 0),
            //New Code 10/1/2022 11:34, just changed the dimension distances by half
            height: 50,
            decoration: BoxDecoration(
              color: widget.temp
                  ? Colors
                      .orange // (HS 10/5/22 @ 1:12AM) orange represent temp spaces
                  : widget.open
                      ? Colors.green
                      : Colors.red,
              border: Border(
                left: BorderSide(
                    color: Colors.white,
                    width: widget.type == SpaceType.handicapL ? 12 : 2),
                right: BorderSide(
                    color: Colors.white,
                    width: widget.type == SpaceType.handicapR ? 12 : 2),
                bottom: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
