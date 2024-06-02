import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/record.dart';

class RecordService {
  final String baseUrl = "https://json-server-greenhouse.vercel.app/";

  Future<List<Record>> getRecords() async {
    final response = await http.get(Uri.parse('${baseUrl}records'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> recordsList = body['records']; // Adjust this line based on the actual structure of your JSON response
      return recordsList.map((dynamic item) => Record.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load records');
    }
  }

  Future<List<Record>> getRecordsByCropAndPhase(String cropId, String phase) async {
    final response = await http.get(Uri.parse('${baseUrl}records'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> recordsList = body['records']; // Adjust this line based on the actual structure of your JSON response
      List<Record> records = recordsList.map((dynamic item) => Record.fromJson(item)).toList();
      return records.where((record) => record.cropId == cropId && record.phase == phase).toList();
    } else {
      throw Exception('Failed to load records');
    }
  }
}