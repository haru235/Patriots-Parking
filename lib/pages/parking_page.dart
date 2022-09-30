import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:patriots_parking/utils/util.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  }

  ParkingLot? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          // allow zoom and scroll
          InteractiveViewer(
            maxScale: 10,
            child: Center(
              // show UT Tyler map when no parking lot selected
              child: FittedBox(
                child: selected ??
                    const Image(
                      image: AssetImage('assets/uttylerMap.jpg'),
                    ),
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
              for (ParkingLot lot in locator.get<AppState>().parkingLots) ...[
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
