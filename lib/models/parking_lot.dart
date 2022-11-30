import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_space.dart';
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
  final List<List<num>> buttonData;
  final List<List<num>> roadPath;
  const ParkingLot({
    this.id = '',
    required this.name,
    required this.width,
    required this.height,
    this.buttonData = const [],
    this.roadPath = const [],
    super.key,
  });

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
        child: Selector<AppState, List<ParkingSpace>>(
          selector: (p0, p1) => p1.parkingSpaces,
          builder: (_, value, __) {
            return Stack(
              children: [
                ...(value).where((element) => element.parkingLot == name),
              ],
            );
          },
        ),
      ),
    );
  }
}
