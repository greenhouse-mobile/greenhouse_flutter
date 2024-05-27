enum CropPhase {
  stock,
  preparationArea,
  bunker,
  tunnel,
  incubation,
  casing,
  induction,
  harvest,
}

extension CropPhaseExtension on CropPhase {
  static final Map<CropPhase, String> _phaseNames = {
    CropPhase.stock: "Formula",
    CropPhase.preparationArea: "Preparation Area",
    CropPhase.bunker: "Bunker",
    CropPhase.tunnel: "Tunnel",
    CropPhase.incubation: "Incubation",
    CropPhase.casing: "Casing",
    CropPhase.induction: "Induction",
    CropPhase.harvest: "Harvest",
  };

  static final Map<CropPhase, String> _phaseNumbers = {
    CropPhase.stock: "0",
    CropPhase.preparationArea: "1",
    CropPhase.bunker: "2",
    CropPhase.tunnel: "3",
    CropPhase.incubation: "4.1",
    CropPhase.casing: "4.2",
    CropPhase.induction: "4.3",
    CropPhase.harvest: "4.4",
  };

  String get phaseName => _phaseNames[this] ?? '';
  String get phaseNumber => _phaseNumbers[this] ?? '';
}
