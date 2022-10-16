import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/auth_methods.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:patriots_parking/utils/util.dart';

import '../models/campus_map.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TransformationController _mapController = TransformationController();
  final TransformationController _parkingController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    // initialize subscriptions to parking lot and space collections
    locator.get<FirestoreMethods>().initializeSubscriptions();
  }

  @override
  void dispose() {
    super.dispose();
    // close subscriptions to parking lot and space collections
    locator.get<FirestoreMethods>().cancelSubscriptions();
    _mapController.dispose();
    _parkingController.dispose();
  }

  ParkingLot? selected;
  @override
  Widget build(BuildContext context) {
    //7:45AM 10/4/2022
    //spacerows(20, 900, 26); <- This method will create spaces, first space will be at x:20 and y:900 when using the coordinates referencees established by the gray
    //container.  KEEP THIS METHOD COMMENTED, i am not sure how the database or graphics would respond if it is run again.
    Navigator.canPop(context) ? Navigator.pop(context) : null;
    List<ParkingLot> tempLots = [
      const ParkingLot(
        name: 'Lot18',
        width: 700,
        height: 800,
        roadPath: [],
      ),
    ]; // temp parking lots for testing without firebase

    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => {
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        locator.get<AuthMethods>().signout();
                      },
                      child: const Text('Sign Out'),
                    ),
                  ],
                ),
              ),
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // allow zoom and scroll
          InteractiveViewer(
            transformationController:
                selected != null ? _parkingController : _mapController,
            maxScale: 10,
            child: Center(
              // show UT Tyler map when no parking lot selected
              child: FittedBox(
                child: selected ?? const CampusMap(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                selected == null ? 'Campus Map' : selected!.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      // parking lot selection button
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.local_parking, size: 30),
        onPressed: () {
          // parking lot selection list
          tapDismissibleModalSheet(
            context: context,
            title: 'Parking Lots',
            children: [
              for (ParkingLot lot
                  in locator.get<AppState>().parkingLots + tempLots) ...[
                GestureDetector(
                  onTap: () => setState(() {
                    selected == lot ? selected = null : selected = lot;
                    Navigator.pop(context);
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: lot == selected ? Colors.grey : Colors.white,
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(lot.name),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
