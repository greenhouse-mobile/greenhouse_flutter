import 'dart:convert';
import 'package:greenhouse/config.dart';
import 'package:greenhouse/services/user_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/record.dart';

class RecordService {
  final String baseUrl = Config.baseUrl;

  Future<List<Record>> getRecords() async {
    final response = await http.get(Uri.parse('${baseUrl}records'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> recordsList = body[
          'records']; // Adjust this line based on the actual structure of your JSON response
      return recordsList.map((dynamic item) => Record.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load records');
    }
  }

  Future<List<Record>> getRecordsByCropAndPhase(
      String cropId, String phase) async {
    final token = await UserPreferences.getToken();
    final response = await http.get(
      Uri.parse('${baseUrl}records/$cropId/${phase.toLowerCase()}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Use token for authentication
      },
    );
    print("Response: ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> recordsList = body[
          'records']; // Adjust this line based on the actual structure of your JSON response
      print("Records List: $recordsList");
      return recordsList.map((dynamic item) => Record.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load records');
    }
  }
}
