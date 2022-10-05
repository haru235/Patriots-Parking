//New File, this is to draw the parking lots borders.  If I am able to get the data of the coordinates from the database for moveTo and lineTo so the applications updates in real time, I might be able to draw the roads inside the parking lot
import 'package:flutter/material.dart';

class ParkingBorderLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.black;

    var temporaryVariable = Path()
      ..moveTo(650, 0) //middle line
      ..lineTo(650, 1000)
      ..moveTo(650,
          150) //line where sections of parking differ in height, left section has two additional rows than right
      ..lineTo(1300, 150)
      ..moveTo(650,
          930) //line to draw the end of the parking lot, it would represent the road when entering the university
      ..lineTo(70, 930)
      ..moveTo(40,
          930) //this would represent the left most exit that is on parking lot 15, the middle main entrance will be drawn later
      ..lineTo(40, 0);

    canvas.drawPath(temporaryVariable, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // // (HS 10/5/22 @ 1:27AM) to avoid error
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
