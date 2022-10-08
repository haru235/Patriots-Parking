import 'package:patriots_parking/models/documentcreate.dart';
import 'package:patriots_parking/models/parking_space.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:provider/provider.dart';
import 'package:patriots_parking/models/custom_paint.dart';

// parking lot object
class ParkingLot extends StatelessWidget {
  final String id;
  final String name;
  final num width;
  final num height;
  final List<List<num>> roadPath;
  const ParkingLot({
    this.id = '',
    required this.name,
    required this.width,
    required this.height,
    this.roadPath = const [],
    super.key,
  });

// convert ParkingLot to json to send to firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'width': width,
      'height': height,
      'roadPath': roadPath,
    };
  }

// convert json data from firestore to ParkingLot
  static ParkingLot fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      width: json['width'],
      roadPath: json['roadPath'],
    );
  }

  /*New code made on 10/1/2022 at 11:18PM, This code is to make the border lines of the parking lot.  What I did is I just added Widget CustomPaint and moved it above
      the widget of Consumer<Appstate>.  This was the only place where the code worked normally, If I place in the last place of the widget tree it throws an error
      when I select a parking space.  The CustomPaint uses a Parking_Border_Line instance, which is just the coordinates and drawing tool to draw the black lines.
  */
  @override
  Widget build(BuildContext context) {
    //ET-9/29/2022 10:35PM, added a singlechildscrollView widget to be able to
    //    move around lot in case parking spaces do not fit in window
    //HS-9/30/2022 9:28PM, SingleChildScrollView only scrolls in one direction.
    //    Instead, used FittedBox to contain parkinglot in window. Scroll and zoom
    //    taken care of by InteractiveViewer.

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
    ]; // sample use of tempRows

    /*
      10/8/2022 - remove comment block to activate the reference lines, and comment the other return statement block. if prefer to not use them, leave this commented
        return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      color: Color.fromARGB(129, 0, 0, 0),
      child: CustomPaint(
        painter: CoordinateSystem(width, height), <-the change of widget tree starts here, I just moved ParkingBorderLine a level lower than it was
        child: CustomPaint(                        and replaced it with CoordinateSystem in its previous place.  
          painter: ParkingBorderLine(
            path: getPath(name),
          ), //adjust to parking lots
          child: Consumer<AppState>(
            builder: (_, value, __) {
              return Stack(
                children: [
                  ...(value.parkingSpaces + tempSpaces) // add temp spaces
                      .where((element) => element.parkingLot == name),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  */
    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      color: Colors.transparent,
      child: CustomPaint(
        painter:
            ParkingBorderLine(path: getPath(name)), //adjust to parking lots
        child: Consumer<AppState>(
          builder: (_, value, __) {
            return Stack(
              children: [
                ...(value.parkingSpaces + tempSpaces) // add temp spaces
                    .where((element) => element.parkingLot == name),
              ],
            );
          },
        ),
      ),
    );
  }

  List<List<num>> getPath(String name) {
    List<List<num>> p = [];
    if (name == 'Lot18') {
      p = [
        // vertical road from entrance
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
      ];
    } else {
      [
        //middle line
        [650, 0, 650, 1000],
        //line where sections of parking differ in height, left section has two additional rows than right
        [650, 150, 1300, 150],
        //line to draw the end of the parking lot, it would represent the road when entering the university
        [650, 930, 70, 930],
        //this would represent the left most exit that is on parking lot 15, the middle main entrance will be drawn later
        [40, 930, 40, 0],
      ];
    }
    return p;
  }
}
