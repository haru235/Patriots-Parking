import 'package:flutter/material.dart';
import 'package:patriots_parking/models/Statistical_Data.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/models/user.dart';
import 'package:patriots_parking/pages/passcodePopup.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firebase/auth_methods.dart';
import 'package:patriots_parking/resources/firebase/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:patriots_parking/utils/util.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    //7:45AM 10/4/2022
    //spacerows(20, 900, 26); <- This method will create spaces, first space will be at x:20 and y:900 when using the coordinates referencees established by the gray
    //container.  KEEP THIS METHOD COMMENTED, i am not sure how the database or graphics would respond if it is run again.
    Navigator.canPop(context) ? Navigator.pop(context) : null;
    return Builder(builder: (context) {
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
                      if (locator.get<AppState>().userData.admin) ...[
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await locator
                                .get<FirestoreMethods>()
                                .toggleAdmin(false);
                          },
                          child: const Text('Switch to User'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await locator
                                .get<FirestoreMethods>()
                                .calibrateStatisticalData();
                          },
                          child: const Text('Callibrate Parking Lots'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await locator
                                .get<FirestoreMethods>()
                                .addAllSpacesToCollection();
                          },
                          child: const Text('Reload Spaces from Backup'),
                        ),
                      ] else ...[
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            if (locator.get<AppState>().userData.isAdmin) {
                              await locator
                                  .get<FirestoreMethods>()
                                  .toggleAdmin(true);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => const PassCode());
                            }
                          },
                          child: const Text('Switch to Admin'),
                        ),
                      ],
                      TextButton(
                        onPressed: () async {
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
        // listen to changes in selected lot
        body: Selector<AppState, ParkingLot?>(
            selector: (
              p0,
              p1,
            ) =>
                p1.selectedLot,
            builder: (_, selected, __) {
              return Stack(
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
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(.8),
                      ),
                      // show selected lot name
                      child: Text(
                        selected == null ? 'Campus Map' : selected.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  locator.get<AppState>().selectedLot != null
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            // button to go back to map
                            child: TextButton(
                              onPressed: () =>
                                  locator.get<AppState>().setLot(null),
                              child: const Text(
                                '<- Back to Map',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Selector<AppState, UserModel>(
                      selector: (p0, p1) => p1.userData,
                      builder: (_, value, __) {
                        return value.admin
                            ? const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Admin Mode",
                                      style: TextStyle(fontSize: 18)),
                                ),
                              )
                            : Container();
                      }),
                ],
              );
            }),
        // parking lot selection button
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.local_parking, size: 30),
          onPressed: () {
            // parking lot selection list
            tapDismissibleModalSheet(
                context: context,
                title: 'Parking Lots',
                children: [
                  Column(children: [
                    for (ParkingLot lot
                        in locator.get<AppState>().parkingLots) ...[
                      // update selected lot when clicked
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                locator.get<AppState>().setLot(lot);
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
                                    color: lot ==
                                            locator.get<AppState>().selectedLot
                                        ? Colors.white
                                        : Colors.grey,
                                    border: Border.all(),
                                  ),
                                  child: Center(child: Text(lot.name)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Builder(builder: (context) {
                                List<StatisticalData> dataMatch = locator
                                    .get<AppState>()
                                    .parkingData
                                    .where((element) =>
                                        element.parkingLotName == lot.name)
                                    .toList();
                                if (dataMatch.isNotEmpty) {
                                  StatisticalData data = dataMatch.first;
                                  return Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: data.available! > data.total! / 2
                                            ? Colors.green
                                            : data.available! > data.total! / 4
                                                ? Colors.yellow
                                                : Colors.red),
                                    child: Center(
                                      child: Text(
                                        '${data.available} Available',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                                return Container();
                              }),
                            ),
                          ),
                        ],
                      ),
                    ]
                  ])
                ]);
          },
        ),
      );
    });
  }
}
