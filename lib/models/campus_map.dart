import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/locator.dart';

class CampusMap extends StatelessWidget {
  const CampusMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(width: 1000, image: AssetImage('assets/uttylerMap.jpg')),
        Positioned(
          left: 438,
          top: 550,
          child: GestureDetector(
            onTap: () => locator
                .get<AppState>()
                .setLot(locator.get<AppState>().getLotByName('Lot18')),
            child: Container(
              height: 44,
              width: 44,
              color: Colors.amber,
              child: CustomPaint(
                painter: ParkingButton(vertices: [
                  [0, 0],
                  [44, 0],
                  [44, 44],
                  [0, 44],
                  [0, 0],
                ]),
                child: const Center(
                  child: Text('Lot18'),
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //   top: 550,
        //   left: 438,
        //   child: Container(
        //     height: 44,
        //     width: 44,
        //     color: Colors.green,
        //     child: const Center(
        //       child: Text('P18'),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class ParkingButton extends CustomPainter {
  final List<List<num>> vertices;
  ParkingButton({this.vertices = const []});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey
      ..strokeWidth = 0;

    Path path = Path();

    //draw shape
    for (int i = 0; i < vertices.length; i++) {
      if (i == 0) {
        path.moveTo(vertices[i][0].toDouble(), vertices[i][1].toDouble());
      } else {
        path.lineTo(vertices[i][0].toDouble(), vertices[i][1].toDouble());
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
