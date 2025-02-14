import 'package:http/http.dart' as http;

import '../../models/user.dart';
//import '../models/user.dart';

class ResetService {
  static const _baseUrl = 'https://example.com/api';
  final http.Client _httpClient;

  ResetService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<void> resetPassword(User user) async {
    final response = await _httpClient.post(
      Uri.parse('$_baseUrl/reset-password'),
      body: user.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to reset password: ${response.body}');
    }
  }
}
