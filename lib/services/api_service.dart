import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/thought.dart';
import '../utils/constants.dart';
import 'storage_service.dart';

class ApiService {
  final StorageService _storage = StorageService();

  Future<Thought?> fetchDailyThought() async {
    try {
      final resp = await http.get(Uri.parse("https://zenquotes.io/api/today"));
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final t = Thought(
          text: (data["q"] ?? "").toString(),
          author: (data["a"] ?? "Unknown").toString(),
        );
        await _storage.saveLatestThought(t);
        return t;
      }
    } catch (e) {
      print("Error fetching daily thought: $e");
    }
  }

  Thought? getCachedThought() => _storage.getLatestThought();
}
