import 'package:flutter/material.dart'; //To draw reference lines, important lines are from line 20 to line 33.

class CoordinateSystem extends CustomPainter {
  double width = 0;
  double height = 0;
  CoordinateSystem(this.width, this.height);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Color.fromARGB(160, 197, 198, 199);

    Path path_Yaxis = Path();
    Path path_Xaxis = Path();

    for (double i = 0; i < width; i = i + 12.5) {
      //This loop draws the lines in the y direction.
      path_Yaxis //variable i will move from left to right at the top at 12.5
        ..moveTo(i, 0) //intervals.  it will then draw a line from i to the
        ..lineTo(i, height); // total length of the height

      canvas.drawPath(path_Yaxis, paint);
    }

    for (double i = 0; i < height; i = i + 12.5) {
      //a similar procedure as the previous loop, but
      path_Xaxis //starting from and to different coordinates
        ..moveTo(0, i) //this draws the horizontal lines
        ..lineTo(width, i);

      canvas.drawPath(path_Xaxis, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // // (HS 10/5/22 @ 1:27AM) to avoid error
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
