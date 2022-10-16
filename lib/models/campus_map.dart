import 'package:flutter/material.dart';

class CampusMap extends StatelessWidget {
  const CampusMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(width: 1000, image: AssetImage('assets/uttylerMap.jpg')),
        Positioned(
          top: 550,
          left: 438,
          child: Container(
            height: 44,
            width: 44,
            color: Colors.green,
            child: const Center(
              child: Text('P18'),
            ),
          ),
        ),
      ],
    );
  }
}
