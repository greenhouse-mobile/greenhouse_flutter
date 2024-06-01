import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/editing_textForm.dart';
import 'package:greenhouse/models/record.dart';
import 'package:greenhouse/widgets/message_response.dart';

class EditRecordScreen extends StatefulWidget {
  const EditRecordScreen({
    super.key,
    required this.record,
    required this.updateRecord,
  });

  final Record record;
  final Function(Record) updateRecord;

  @override
  State<EditRecordScreen> createState() => _EditRecordScreenState();
}

class _EditRecordScreenState extends State<EditRecordScreen> {
  late TextEditingController _hayController;
  late TextEditingController _cornController;
  late TextEditingController _cottonSeedCakeController;
  late TextEditingController _soybeanMealController;
  late TextEditingController _ureaController;
  late TextEditingController _ammoniumSulfateController;

  @override
  void initState() {
    _hayController = TextEditingController();
    _cornController = TextEditingController();
    _cottonSeedCakeController = TextEditingController();
    _soybeanMealController = TextEditingController();
    _ureaController = TextEditingController();
    _ammoniumSulfateController = TextEditingController();
    super.initState();
  }

  String getPayloadValue(String name) {
    for (var payload in widget.record.payload.data) {
      if (payload.name == name) {
        return payload.value;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go back', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Crop ID: ${widget.record.cropId}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C6444)),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.record.phase,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Record ID: ${widget.record.id}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EditingTextForm(
                        hintText: "Hay",
                        valueController: _hayController,
                        placeholderText: getPayloadValue('Hay'),
                      ),
                      EditingTextForm(
                        hintText: "Corn",
                        valueController: _cornController,
                        placeholderText: getPayloadValue('Corn'),
                      ),
                      EditingTextForm(
                        hintText: "Guano",
                        valueController: _cornController,
                        placeholderText: getPayloadValue('Guano'),
                      ),
                      EditingTextForm(
                        hintText: "Cotton seed cake",
                        valueController: _cottonSeedCakeController,
                        placeholderText: getPayloadValue('Cotton seed cake'),
                      ),
                      EditingTextForm(
                        hintText: "Soybean meal",
                        valueController: _soybeanMealController,
                        placeholderText: getPayloadValue('Soybean meal'),
                      ),
                      EditingTextForm(
                        hintText: "Urea",
                        valueController: _ureaController,
                        placeholderText: getPayloadValue('Urea'),
                      ),
                      EditingTextForm(
                        hintText: "Ammonium sulfate",
                        valueController: _ammoniumSulfateController,
                        placeholderText: getPayloadValue('Ammonium sulfate'),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Color(0xFF67864A),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: Color(0xFF4C6444),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            String hay = _hayController.text.isEmpty
                                ? getPayloadValue('Hay')
                                : _hayController.text;
                            String corn = _cornController.text.isEmpty
                                ? getPayloadValue('Corn')
                                : _cornController.text;
                            String guano = _cornController.text.isEmpty
                                ? getPayloadValue('Guano')
                                : _cornController.text;
                            String cottonSeedCake =
                                _cottonSeedCakeController.text.isEmpty
                                    ? getPayloadValue('Cotton seed cake')
                                    : _cottonSeedCakeController.text;
                            String soybeanMeal =
                                _soybeanMealController.text.isEmpty
                                    ? getPayloadValue('Soybean meal')
                                    : _soybeanMealController.text;
                            String urea = _ureaController.text.isEmpty
                                ? getPayloadValue('Urea')
                                : _ureaController.text;
                            String ammoniumSulfate =
                                _ammoniumSulfateController.text.isEmpty
                                    ? getPayloadValue('Ammonium sulfate')
                                    : _ammoniumSulfateController.text;

                            if (hay.isNotEmpty ||
                                corn.isNotEmpty ||
                                guano.isNotEmpty ||
                                cottonSeedCake.isNotEmpty ||
                                soybeanMeal.isNotEmpty ||
                                urea.isNotEmpty ||
                                ammoniumSulfate.isNotEmpty) {
                              final updatedRecord = Record(
                                id: widget.record.id,
                                cropId: widget.record.cropId,
                                createdAt: widget.record.createdAt,
                                createdBy: widget.record.createdBy,
                                cropDay: widget.record.cropDay,
                                updatedAt: widget.record.updatedAt,
                                phase: widget.record.phase,
                                payload: Payload(
                                  data: [
                                    PayloadData(
                                      name: 'Hay',
                                      value: hay,
                                    ),
                                    PayloadData(
                                      name: 'Corn',
                                      value: corn,
                                    ),
                                    PayloadData(
                                      name: 'Guano',
                                      value: guano,
                                    ),
                                    PayloadData(
                                      name: 'Cotton seed cake',
                                      value: cottonSeedCake,
                                    ),
                                    PayloadData(
                                      name: 'Soybean meal',
                                      value: soybeanMeal,
                                    ),
                                    PayloadData(
                                      name: 'Urea',
                                      value: urea,
                                    ),
                                    PayloadData(
                                      name: 'Ammonium sulfate',
                                      value: ammoniumSulfate,
                                    ),
                                  ],
                                ),
                              );

                              void editRecord() {
                                try {
                                  widget.updateRecord(updatedRecord);
                                  Navigator.pop(context, updatedRecord);
                                } catch (e) {
                                  print('Failed to update company: $e');
                                }
                              }

                              messageResponse(
                                context,
                                "Are you sure you want to\nedit record ${widget.record.id}?",
                                "Yes, Edit",
                                editRecord,
                              );
                            }
                          },
                          child: Text('Save',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
