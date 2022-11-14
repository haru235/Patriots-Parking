import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:provider/provider.dart';
import 'package:patriots_parking/resources/road_paint.dart';

import '../utils/global_variables.dart';

// parking lot object
class ParkingLot extends StatelessWidget {
  final String id;
  final String name;
  final num width;
  final num height;
  final num mapX;
  final num mapY;
  final num mapR;
  final List<List<num>> buttonList;
  final List<List<num>> roadPath;
  const ParkingLot({
    this.id = '',
    required this.name,
    required this.width,
    required this.height,
    required this.mapX,
    required this.mapY,
    required this.mapR,
    this.buttonList = const [],
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
      'mapX': mapX,
      'mapY': mapY,
      'mapR': mapR,
      'buttonList': buttonList,
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
      mapX: json['mapX'],
      mapY: json['mapY'],
      mapR: json['mapR'],
      buttonList: json['buttonList'] ?? [],
      roadPath: json['roadPath'] ?? [],
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
    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      color: debugMode ? Colors.blue : null,
      child: CustomPaint(
        painter: RoadPaint(path: roadPath),
        child: Consumer<AppState>(
          builder: (_, value, __) {
            return Stack(
              children: [
                ...(value.parkingSpaces)
                    .where((element) => element.parkingLot == name),
              ],
            );
          },
        ),
      ),
    );
  }
}
