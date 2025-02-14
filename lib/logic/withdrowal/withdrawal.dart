// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../requests/paymentnitification.dart';

class PaymentData {
  String requestId;
  double amount;
  String requestStatus;
  String channelId;
  String userId;
  dynamic paymentRequestResult;
  DateTime createdDateUtc;

  PaymentData({
    required this.requestId,
    required this.amount,
    required this.requestStatus,
    required this.channelId,
    required this.userId,
    this.paymentRequestResult,
    required this.createdDateUtc,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      requestId: json['request_id'],
      amount: json['total_amount'],
      requestStatus: json['request_status'],
      channelId: json['channel_id'],
      userId: json['user_id'],
      paymentRequestResult: json['payment_request_result'],
      createdDateUtc: DateTime.parse(json['created_date_utc']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'amount': amount,
      'request_status': requestStatus,
      'channel_id': channelId,
      'user_id': userId,
      'payment_request_result': paymentRequestResult,
      'created_date_utc': createdDateUtc.toIso8601String(),
    };
  }
}

class PaymentResponse {
  PaymentData data;
  String statusUrl;

  PaymentResponse({
    required this.data,
    required this.statusUrl,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      data: PaymentData.fromJson(json['data']),
      statusUrl: json['status_url'],
    );
  }
}

Future<PaymentResponse> withdrawFromChannel(
    {required String channelId,
    required int amount,
    required int destinationId,
    required String accountNumber,
    required String accessToken}) async {
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channelId/withdraw';

  Map<String, dynamic> requestBody = {
    'amount': amount,
    'beneficiary': {
      'bank_id': destinationId,
      'account_number': accountNumber,
      'save_beneficiary': true,
    },
  };

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      PaymentResponse resp = PaymentResponse.fromJson(responseData);
      return resp;
    } else {
      throw Exception(response.statusCode);
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<String?> withdrowalNotification(
    {required String req_id, required String access_token}) async {
  try {
    final url = Uri.parse('https://api.changachanga.co.ke/api/v1$req_id');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access_token',
      },
    );
    if (response.statusCode == 200) {
      // Request successful
      final responseData = jsonDecode(response.body);
      // Do something with the response
      final data = RequestModel.fromJson(responseData);
      String? status = data.requestStatus;
      return status;
    } else {
      final responseData = jsonDecode(response.body);
      throw Exception(responseData['detail']);
      // Request failed
      // Handle the failure accordingly
    }
  } catch (e) {
    throw Exception(e);
    // Exception occurred during the API request
    // Handle the exception accordingly
  }
}

class Withdrawal {
  String transactionType;
  double amount;
  String reason;
  String paymentReferenceId;
  String transactionId;
  User user;
  String channelId;
  DateTime timestampUtc;

  Withdrawal({
    required this.transactionType,
    required this.amount,
    required this.reason,
    required this.paymentReferenceId,
    required this.transactionId,
    required this.user,
    required this.channelId,
    required this.timestampUtc,
  });

  factory Withdrawal.fromJson(Map<String, dynamic> json) {
    return Withdrawal(
      transactionType: json['transaction_type'],
      amount: json['amount'],
      reason: json['reason'],
      paymentReferenceId: json['payment_reference_id'],
      transactionId: json['transaction_id'],
      user: User.fromJson(json['user']),
      channelId: json['channel_id'],
      timestampUtc: DateTime.parse(json['timestamp_utc']),
    );
  }
}

class User {
  String firstName;
  String username;
  String emailAddress;
  String phoneNumber;
  bool isActive;
  String userId;
  String profilePhoto;
  DateTime dateJoinedUtc;

  User({
    required this.firstName,
    required this.username,
    required this.emailAddress,
    required this.phoneNumber,
    required this.isActive,
    required this.userId,
    required this.profilePhoto,
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
      profilePhoto: json['profile_photo'],
      dateJoinedUtc: DateTime.parse(json['date_joined_utc']),
    );
  }
}

class ApiService {
  static const String baseUrl =
      'https://api.changachanga.co.ke/api/v1/channels';

  Future<List<Withdrawal>> fetchWithdrawals(
      String channelId, String accessToken) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/$channelId/withdrawals'), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Withdrawal.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load withdrawals');
      }
    } catch (e) {
      throw Exception('Failed $e');
    }
  }
}
