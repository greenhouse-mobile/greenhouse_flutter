import 'dart:convert';
import 'package:greenhouse/services/user_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/crop.dart';

class CropService {

  final String baseUrl = "http://10.0.2.2:3000/api/v1/";

  Future<List> getCrops() async {
    final response = await http.get(
      Uri.parse('${baseUrl}crops'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${UserPreferences.getToken()}', // Use token for authentication
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load crops');
    }
  }

  Future<List<Crop>> getCropsByState(bool state) async {
    final token = await UserPreferences.getToken();
    final response = await http.get(
      Uri.parse('${baseUrl}crops'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Use token for authentication
      },
    );
    if (response.statusCode == 200) {
      /*Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> crops = body['crops'];
      return crops.map((dynamic item) => Crop.fromJson(item)).toList();*/
      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> crops = body['crops']; // Adjust this line based on the actual structure of your JSON response
      List<Crop> cropObjects = crops.map((dynamic item) => Crop.fromJson(item)).toList();
      List<Crop> filteredCrops = cropObjects.where((Crop crop) => crop.state == state).toList();
      return filteredCrops;
    } else {
      throw Exception('Failed to load crops');
    }
  }
}