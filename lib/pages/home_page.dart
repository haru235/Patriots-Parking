import 'package:flutter/material.dart';
import 'package:patriots_parking/models/parking_lot.dart';
import 'package:patriots_parking/parking_lot_dada.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          InteractiveViewer(
            maxScale: 10,
            child: Center(
              child: selected ?? const Text('Parking lot not selected.'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.local_parking, size: 30),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            context: context,
            builder: (context) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: GestureDetector(
                  onTap: () {},
                  child: DraggableScrollableSheet(
                    maxChildSize: 0.6,
                    initialChildSize: 0.5,
                    minChildSize: 0.4,
                    builder: (context, scrollController) => Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Parking Lots',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView(
                              controller: scrollController,
                              children: [
                                if (parkingLots.isNotEmpty) ...[
                                  for (ParkingLot lot in parkingLots) ...[
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        selected = lot;
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
                                              color: lot == selected
                                                  ? Colors.grey
                                                  : Colors.white,
                                              border: Border.all()),
                                          child: Center(
                                            child: Text(lot.name),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
