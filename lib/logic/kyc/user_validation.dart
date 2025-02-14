import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class KYCRequest {
  String? firstName;
  String? idNumber;
  int? yearOfBirth;

  KYCRequest({this.firstName, this.idNumber, this.yearOfBirth});

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'id_number': idNumber,
      'year_of_birth': yearOfBirth,
    };
  }
}

class KYCResponse {
  String? state;
  String? requestStatus;
  String? statusReason;
  String? requestId;
  String? fullName;
  String? citizenship;
  String? dob;
  String? gender;
  String? idNumber;
  String? createdDateUtc;

  KYCResponse({
    this.state,
    this.requestStatus,
    this.statusReason,
    this.requestId,
    this.fullName,
    this.citizenship,
    this.dob,
    this.gender,
    this.idNumber,
    this.createdDateUtc,
  });

  factory KYCResponse.fromJson(Map<String, dynamic> json) {
    return KYCResponse(
      state: json['state'],
      requestStatus: json['request_status'],
      statusReason: json['status_reason'],
      requestId: json['request_id'],
      fullName: json['full_name'],
      citizenship: json['citizenship'],
      dob: json['dob'],
      gender: json['gender'],
      idNumber: json['id_number'],
      createdDateUtc: json['created_date_utc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'request_status': requestStatus,
      'status_reason': statusReason,
      'request_id': requestId,
      'full_name': fullName,
      'citizenship': citizenship,
      'dob': dob,
      'gender': gender,
      'id_number': idNumber,
      'created_date_utc': createdDateUtc,
    };
  }
}

// Function to call the API
Future<KYCResponse> validateKYC({required KYCRequest request}) async {
  final url =
      Uri.parse('https://api.changachanga.co.ke/api/v1/users/validate-kyc');
  String apiKey = dotenv.env['API_KEY']!;
  final headers = {
    'Content-Type': 'application/json',
    'apikey': apiKey,
  };

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return KYCResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to validate KYC: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to validate KYC: $e');
  }
}
