import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecordCard extends StatefulWidget {
  final String entryDate;
  final String recordId;
  final String author;
  final String currentPhase;

  const RecordCard(
      {super.key,
      required this.entryDate,
      required this.recordId,
      required this.author,
      required this.currentPhase});

  @override
  State<RecordCard> createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFF),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Record ID: ${widget.recordId}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline,
                          color: Color(0xFF465B3F)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Author: '),
                      ),
                      Text(widget.author),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined,
                          color: Color(0xFF465B3F)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Entry Date: '),
                      ),
                      Text(widget.entryDate),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/crops_in_progress_images/plant.svg',
                          height: 20.0,
                          width: 12.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Current Phase: '),
                      ),
                      Text(widget.currentPhase),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
