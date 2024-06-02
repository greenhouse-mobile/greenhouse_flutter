class Company {
  final String name;
  final String tin;
  final String iconUrl;

  Company({
    required this.name,
    required this.tin,
    required this.iconUrl,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      tin: json['tin'],
      iconUrl: json['iconUrl'],
    );
  }
}
