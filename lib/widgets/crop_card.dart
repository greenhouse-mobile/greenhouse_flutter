import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CropCard extends StatefulWidget {
  final String startDate;
  final String currentPhase;
  final String cropId; // Add your new variable here

  const CropCard({super.key, required this.startDate, required this.currentPhase, required this.cropId}); // Include the new variable in the constructor

  @override
  State<CropCard> createState() => _CropCardState();
}

class _CropCardState extends State<CropCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Card(
              color: Color(0xFFFFFFFF),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(30,15,30,15),
              child: Column(
                children: [
                  Image.asset('assets/crops_in_progress_images/mushroom.jpeg'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Crop ID: ID - ${widget.cropId}'), // Use the variable passed as parameter
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  // Add your button tap code here
                                },
                                child: Row(
                                  children: [
                                    Text('View Logs'),
                                    Icon(Icons.arrow_forward), // Arrow pointing to the right
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                // Add your button tap code here
                              },
                              child: Row(
                                children: [
                                  Text('Delete'),
                                  Icon(Icons.delete, color: Color(0xFF465B3F)), // Delete icon
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft, // Align to the left
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.watch_later_outlined, color: Color(0xFF465B3F)), // Add your icon here with the specified color
                                  Text('Start Date: '),
                                  Text(widget.startDate), // Use the variable passed as parameter
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/crops_in_progress_images/plant.svg', height: 20.0, width: 12.0),
                                  Text('Current Phase: '),
                                  Text(widget.currentPhase), // Use the variable passed as parameter
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}