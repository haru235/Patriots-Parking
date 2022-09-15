import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    double _x = 100;
    double _y = 100;
    var _logoSize = 100.0;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Stack(
          children: <Widget>[
            Positioned(
              // int _x=0,
              //left: _x,
              //top: _y,
              child: Draggable(
                child: FlutterLogo(size: _logoSize),
                feedback: FlutterLogo(size: _logoSize),
                childWhenDragging: Container(),
                onDragEnd: (dragDetails) {
                  setState(() {
                    _x = dragDetails.offset.dx;
                    // if applicable, don't forget offsets like app/status bar
                    _y = dragDetails
                        .offset.dy; //- appBarHeight - statusBarHeight;
                  });
                },
              ),
            )
          ],
        )));
  }
}
