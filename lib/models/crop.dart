class Crop {
  final String id;
  final String createdDate;
  final String name;
  final String author;
  final bool active;
  final String phase;

  Crop({
    required this.id,
    required this.createdDate,
    required this.name,
    required this.author,
    required this.active,
    required this.phase,
  });

  factory Crop.fromJson(Map<String, dynamic> json) {
    return Crop(
      id: json['id'],
      createdDate: json['createdDate'],
      name: json['name'],
      author: json['author'],
      active: json['active'],
      phase: json['phase'],
    );
  }
}