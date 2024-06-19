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
  final String author;
  final String createdDate;
  final String updatedDate;
  final String phase;
  final String cropId;
  final Payload payload;

  Record({
    required this.id,
    required this.author,
    required this.createdDate,
    required this.updatedDate,
    required this.phase,
    required this.cropId,
    required this.payload,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      createdDate: json['createdDate'],
      author: json['author'],
      updatedDate: json['updatedDate'],
      phase: json['phase'],
      //Hardcode cropId
      cropId: 'f629f63c-3e96-4527-be6f-c1bddc1af552',
      //cropId: json['cropId'],
      payload: Payload.fromJson(json['payload']),
    );
  }
}
