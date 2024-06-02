import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhouse/models/crop_phase.dart';
import 'package:greenhouse/widgets/delete_dialog.dart';

class CropCard extends StatefulWidget {
  final String startDate;
  final CropCurrentPhase currentPhase;
  final String cropId;
  final String cropName;
  final Function(String) onDelete;

  const CropCard(
      {super.key,
      required this.startDate,
      required this.currentPhase,
      required this.cropId,
      required this.cropName,
      required this.onDelete});

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
            GestureDetector(
              onTap: () {
                if (widget.currentPhase == CropCurrentPhase.harvest) {
                  Navigator.pushNamed(context, '/stepper', arguments: widget);
                } else {
                  Navigator.pushNamed(context, '/stepper', arguments: widget);
                }
              },
              child: Card(
                color: Color(0xFFFFFFFF),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Column(
                  children: [
                    Image.asset('assets/mushroom_images/mushroom.jpeg'),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Crop Name: ${widget.cropName}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text('View Logs',
                                          style: TextStyle(
                                              color: Color(0xFF67864A))),
                                      Icon(Icons.arrow_forward,
                                          color: Color(0xFF67864A)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (widget.currentPhase == CropCurrentPhase.harvest)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    deleteDialog(
                                        context,
                                        "Are you sure you want to \ndelete crop ${widget.cropId}?",
                                        "Yes, Delete",
                                        () => widget.onDelete(widget.cropId));
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Delete',
                                        style:
                                            TextStyle(color: Color(0xFFDE4F4F)),
                                      ),
                                      Icon(Icons.delete,
                                          color: Color(0xFFDE4F4F)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.watch_later_outlined,
                                        color: Color(0xFF465B3F)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Start Date: '),
                                    ),
                                    Text(widget.startDate),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/plant.svg',
                                        height: 20.0, width: 12.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Current Phase: '),
                                    ),
                                    Text(widget.currentPhase.phaseName),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
