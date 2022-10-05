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
  const ParkingLot({
    this.id = '',
    required this.name,
    required this.width,
    required this.height,
    super.key,
  });

// convert ParkingLot to json to send to firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'width': width,
      'height': height,
    };
  }

// convert json data from firestore to ParkingLot
  static ParkingLot fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      width: json['width'],
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
      ...tempRow('Lot18', 125, 150, 6, 90, 1),
      ...tempRow('Lot18', 125, 325, 1, 90, 1),
      ...tempRow('Lot18', 125, 375, 2, 90, 1),
      ...tempRow('Lot18', 125, 450, 1, 90, 1),
      ...tempRow('Lot18', 425, 100, 10, 90, 2),
      ...tempRow('Lot18', 425, 375, 12, 90, 2),
      ...tempRow('Lot18', 575, 25, 8, 90, 0),
      ...tempRow('Lot18', 575, 250, 9, 90, 0),
      ...tempRow('Lot18', 575, 500, 8, 90, 0),
      ...tempRow('Lot18', 275, 225, 8, 90, 1),
      ...tempRow('Lot18', 275, 225, 7, 90, 0),
    ]; // sample use of tempRows

    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      color: Colors.transparent,
      child: CustomPaint(
        painter: ParkingBorderLine(), //adjust to parking lots
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
}
