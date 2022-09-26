import 'package:patriots_parking/models/parking_space.dart';
import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:provider/provider.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'width': width,
      'height': height,
    };
  }

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
    return Container(
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
    );
  }
}
