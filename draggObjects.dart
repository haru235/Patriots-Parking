//to test dragging first and last parking spaces in a row of a parking lot.  Got most of the code from a stackoverflow post, but some code is missing to work.  
//This is to facilitate a user to draw the parking rows faster.  The user doesn't have to drag the spaces exactly, we could round off and use approximations.  
//The user would drag the first and last spaces, then the program would ask, how many spaces in this row? and whatever value is typed, the spaces will be 
//placed in that row.  This code is mainly to facilitate a user to draw rows in the middle of the parking lot, so user doesn't have to worry about coordinate values.
//then transfer data to database
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
