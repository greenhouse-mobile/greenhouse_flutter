import 'dart:convert';

import 'package:http/http.dart' as http;

class CropService {

  final String baseUrl = "https://json-server-greenhouse.vercel.app/";

  Future<List> getCrops() async {
    final response = await http.get(Uri.parse('${baseUrl}crops'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load crops');
    }
  }

  Future<List> getCropsByState(bool state) async { //should be a boolean
    final response = await http.get(Uri.parse('${baseUrl}crops?active=$state'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load crops');
    }
  }
}