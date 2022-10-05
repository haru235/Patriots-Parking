//New File, this is to draw the parking lots borders.  If I am able to get the data of the coordinates from the database for moveTo and lineTo so the applications updates in real time, I might be able to draw the roads inside the parking lot
import 'package:flutter/material.dart';

class ParkingBorderLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50.0
      ..color = Colors.blueGrey;

    var path = Path()
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

// link path to parking lot
    path = Path()
      ..moveTo(525, 100)
      ..lineTo(525, 775)
      ..moveTo(375, 100)
      ..lineTo(375, 775)
      ..moveTo(75, 750)
      ..lineTo(550, 750)
      ..moveTo(200, 625)
      ..lineTo(400, 625)
      ..moveTo(100, 300)
      ..moveTo(225, 650)
      ..lineTo(225, 325)
      ..quadraticBezierTo(225, 300, 375, 275)
      ..moveTo(100, 800)
      ..lineTo(100, 300)
      ..quadraticBezierTo(150, 150, 400, 75)
      ..lineTo(550, 75);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // // (HS 10/5/22 @ 1:27AM) to avoid error
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
