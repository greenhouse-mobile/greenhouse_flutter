import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/profile.dart';

class ProfileService {
  final String baseUrl = "https://json-server-greenhouse.vercel.app/";

  Future<List<Profile>> getProfiles() async {
    final response = await http.get(Uri.parse('${baseUrl}profiles'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> profilesJson = jsonResponse['profiles'];
      return profilesJson.map((profile) => Profile.fromJson(profile)).toList();
    } else {
      throw Exception('Failed to load profiles');
    }
  }

  Future<List<Profile>> getProfilesByCompany(String companyName) async {
    final response = await http.get(Uri.parse('${baseUrl}profiles'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> profilesJson = jsonResponse['profiles'];
      return profilesJson
          .map((profile) => Profile.fromJson(profile))
          .where((profile) => profile.company == companyName)
          .toList();
    } else {
      throw Exception('Failed to load profiles for company: $companyName');
    }
  }

  Future<Profile> addProfile(Profile profile) async {
    final response = await http.post(Uri.parse('${baseUrl}profiles'));
    if (response.statusCode == 201) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create profile');
    }
  }
}
