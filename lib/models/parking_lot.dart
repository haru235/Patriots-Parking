import 'package:patriots_parking/models/parking_space.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(    //---9/29/2022 10:35PM, added a singlechildscrollView widget to be able to move around lot in case parking spaces do not fit in window
      child: Container(
      width: width.toDouble(),
      height: height.toDouble(),
      color: Colors.grey,
      child: Consumer<AppState>(
        builder: (_, value, __) {
          return Stack(
            children: [
              for (ParkingSpace slot in value.parkingSpacess
                  .where((element) => element.parkingLot == name)) ...[slot]
            ],
          );
        },
      ),
    ),
  );    //This paranthesis was added with semicolon, in case of removing singlechildscrollview, delete this parenthesis and semicolon, and in parenthisis above it add a semicolon   
 }
}
