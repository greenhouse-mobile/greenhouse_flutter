class PayloadData {
  final String name;
  final String value;

  PayloadData({required this.name, required this.value});

  factory PayloadData.fromJson(Map<String, dynamic> json) {
    return PayloadData(
      name: json['name'],
      value: json['value'].toString(),
    );
  }
}

class Payload {
  final List<PayloadData> data;

  Payload({required this.data});

  factory Payload.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<PayloadData> dataList =
        list.map((i) => PayloadData.fromJson(i)).toList();
    return Payload(data: dataList);
  }
}

class Record {
  final String id;
  final String createdBy;
  final int cropDay;
  final String createdAt;
  final String updatedAt;
  final String phase;
  final String cropId;
  final Payload payload;

  Record({
    required this.id,
    required this.createdBy,
    required this.cropDay,
    required this.createdAt,
    required this.updatedAt,
    required this.phase,
    required this.cropId,
    required this.payload,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      createdBy: json['created_by'],
      cropDay: json['crop_day'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      phase: json['phase'],
      cropId: json['crop_id'],
      payload: Payload.fromJson(json['payload']),
    );
  }
}
