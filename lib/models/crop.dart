import 'crop_phase.dart';

class Crop {
  final String id;
  final String startDate;
  final CropPhase phase;
  final String state;

  Crop({
    required this.id,
    required this.startDate,
    required this.phase,
    required this.state,
  });
}
