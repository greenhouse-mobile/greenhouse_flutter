import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecordCard extends StatefulWidget {
  final String startDate;
  final String recordId;
  final String author;
  final String currentPhase;

  const RecordCard(
      {super.key,
      required this.startDate,
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
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text('View Logs',
                            style: TextStyle(color: Color(0xFF67864A))),
                        Icon(Icons.arrow_forward, color: Color(0xFF67864A),),
                      ],
                    ),
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
