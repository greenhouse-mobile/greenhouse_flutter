import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile.dart';

class ProfileService {
  final String baseUrl = "https://json-server-greenhouse.vercel.app/";
  List<Profile> profilesList = [];

  Future<List<Profile>> getProfiles() async {
    final response = await http.get(Uri.parse('${baseUrl}profiles'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      profilesList = (jsonResponse['profiles'] as List)
          .map((profileJson) => Profile.fromJson(profileJson))
          .toList();
      return profilesList;
    } else {
      throw Exception('Failed to load profiles');
    }
  }

  Future<List<Profile>> getProfilesByCompany(String companyName) async {
    final response = await http.get(Uri.parse('${baseUrl}profiles'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      profilesList = (jsonResponse['profiles'] as List)
          .map((profileJson) => Profile.fromJson(profileJson))
          .where((profile) => profile.company == companyName)
          .toList();
      return profilesList;
    } else {
      throw Exception('Failed to load profiles for company: $companyName');
    }
  }

  Future<Profile> addProfile(Profile profile) async {
    final response = await http.get(Uri.parse('${baseUrl}profiles'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> existingProfiles = jsonResponse['profiles'] ?? [];
      existingProfiles.add(profile.toJson());

      final postResponse = await http.post(
        Uri.parse('${baseUrl}profiles'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'profiles': existingProfiles}),
      );

      if (postResponse.statusCode == 201) {
        profilesList.add(profile);
        return profile;
      } else {
        throw Exception('Failed to create profile');
      }
    } else {
      throw Exception('Failed to fetch existing profiles');
    }
  }

  List<Profile> getProfilesList() {
    return profilesList;
  }
}
