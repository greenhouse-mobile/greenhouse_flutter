import 'crop_phase.dart';

class Crop {
  final String id;
  final String startDate;
  final CropCurrentPhase phase;
  final String state;
  final String name;

  Crop({
    required this.id,
    required this.startDate,
    required this.phase,
    required this.state,
    required this.name,
  });
}
