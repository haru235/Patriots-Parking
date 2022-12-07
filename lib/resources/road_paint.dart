//New File, this is to draw the parking lot roads.
import 'package:flutter/material.dart';

class RoadPaint extends CustomPainter {
  final List<List<num>> path;
  RoadPaint({this.path = const []});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50.0
      ..color = Colors.blueGrey
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    // (HS 10/7/22 @ 9:47AM) Path data moved to parking_lot.dart under getPath()
    // Build path from List<List<num>> input for better communication with firestore
    for (List<num> road in this.path) {
      if (road.length == 4) {
        path.moveTo(road[0].toDouble(), road[1].toDouble());
        path.lineTo(road[2].toDouble(), road[3].toDouble());
      } else if (road.length == 6) {
        path.moveTo(road[0].toDouble(), road[1].toDouble());
        path.quadraticBezierTo(
          road[2].toDouble(),
          road[3].toDouble(),
          road[4].toDouble(),
          road[5].toDouble(),
        );
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
