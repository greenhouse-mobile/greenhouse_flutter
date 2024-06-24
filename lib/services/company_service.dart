import 'dart:convert';
import 'package:greenhouse/config.dart';
import 'package:greenhouse/models/company.dart';
import 'package:greenhouse/services/user_preferences.dart';
import 'package:http/http.dart' as http;

class CompanyService {
  final String baseUrl = Config.baseUrl;

  Future<Company> getCompanyByProfileId() async {
    final token = await UserPreferences.getToken();
    final profileId = await UserPreferences.getProfileId();

    final response = await http.get(
      Uri.parse('${baseUrl}companies?profileId={$profileId}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return Company.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
