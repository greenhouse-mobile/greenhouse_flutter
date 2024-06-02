import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/crop.dart';

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

  Future<List<Crop>> getCropsByState(bool state) async {
    final response = await http.get(Uri.parse('${baseUrl}crops?active=$state'));
    if (response.statusCode == 200) {
      /*Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> crops = body['crops'];
      return crops.map((dynamic item) => Crop.fromJson(item)).toList();*/
      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> crops = body['crops']; // Adjust this line based on the actual structure of your JSON response
      List<Crop> cropObjects = crops.map((dynamic item) => Crop.fromJson(item)).toList();
      List<Crop> filteredCrops = cropObjects.where((Crop crop) => crop.active == state).toList();
      return filteredCrops;
    } else {
      throw Exception('Failed to load crops');
    }
  }
}