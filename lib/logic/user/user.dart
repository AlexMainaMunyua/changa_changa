import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String firstName;
  final String username;
  final String emailAddress;
  final String phoneNumber;
  final bool isActive;
  final String userId;
  final String dateJoinedUtc;

  User({
    required this.firstName,
    required this.username,
    required this.emailAddress,
    required this.phoneNumber,
    required this.isActive,
    required this.userId,
    required this.dateJoinedUtc,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      username: json['username'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
      isActive: json['is_active'],
      userId: json['user_id'],
      dateJoinedUtc: json['date_joined_utc'],
    );
  }
}

Future<User> updateUser(String phone, String accessToken) async {
  const url = 'https://api.changachanga.co.ke/api/v1/users/me';

  // Request body
  final body = jsonEncode({
    "username": phone,
  });

  // Request headers
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  try {
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Request successful, parse the response
      final responseData = jsonDecode(response.body);
      final user = User.fromJson(responseData);
      return user;
    } else {
      final responseData = jsonDecode(response.body);
      // Request failed, handle the error here
      throw Exception(responseData['detail']);
    }
  } catch (e) {
    // Error occurred during the request
    throw Exception(e);
  }
}
