import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  final String? firstName;
  final String? username;
  final String? emailAddress;
  final String? phoneNumber;
  final bool? isActive;
  final String? userId;
  final String? title;
  final DateTime? dateJoinedUtc;

  User({
    this.firstName,
    this.username,
    this.emailAddress,
    this.phoneNumber,
    this.isActive,
    this.userId,
    this.title,
    this.dateJoinedUtc,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'username': username,
      'email_address': emailAddress,
      'phone_number': phoneNumber,
      'is_active': isActive,
      'user_id': userId,
      'title': title,
      'date_joined_utc': dateJoinedUtc?.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      username: json['username'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
      isActive: json['is_active'],
      userId: json['user_id'],
      title: json['title'],
      dateJoinedUtc: DateTime.tryParse(json['date_joined_utc']),
    );
  }

  @override
  String toString() {
    return 'User{firstName: $firstName, username: $username, emailAddress: $emailAddress, phoneNumber: $phoneNumber, isActive: $isActive, userId: $userId, dateJoinedUtc: $dateJoinedUtc}';
  }
}

class Payment {
  final String transactionType;
  final double amount;
  final String reason;
  final String paymentReferenceId;
  final String transactionId;
  final User? user;
  final String channelId;
  final DateTime timestampUtc;

  Payment({
    required this.transactionType,
    required this.amount,
    required this.reason,
    required this.paymentReferenceId,
    required this.transactionId,
    this.user,
    required this.channelId,
    required this.timestampUtc,
  });

  Map<String, dynamic> toJson() {
    return {
      'transaction_type': transactionType,
      'amount': amount,
      'reason': reason,
      'payment_reference_id': paymentReferenceId,
      'transaction_id': transactionId,
      'user': user?.toJson(),
      'channel_id': channelId,
      'timestamp_utc': timestampUtc.toIso8601String(),
    };
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      transactionType: json['transaction_type'],
      amount: json['amount'],
      reason: json['reason'],
      paymentReferenceId: json['payment_reference_id'],
      transactionId: json['transaction_id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      channelId: json['channel_id'],
      timestampUtc: DateTime.tryParse(json['timestamp_utc'])!,
    );
  }

  @override
  String toString() {
    return 'Payment{transactionType: $transactionType, amount: $amount, reason: $reason, paymentReferenceId: $paymentReferenceId, transactionId: $transactionId, user: $user, channelId: $channelId, timestampUtc: $timestampUtc}';
  }
}

Future<List<Payment>> fetchStatementsPaginated(
    {required String accessToken,
    required String channelNumber,
    required int page,
    required int limit}) async {
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channelNumber/transactions/?page=$page&per_page=$limit';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  try {
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      List<Payment> statements;
      statements = responseData.map((resp) => Payment.fromJson(resp)).toList();
      return statements;
    } else {
      final responseData = jsonDecode(response.body);
      throw Exception(responseData['detail']);
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<Payment>> fetchStatements(
    String accessToken, String channelNumber) async {
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channelNumber/transactions/';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  try {
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      List<Payment> statements;
      statements = responseData.map((resp) => Payment.fromJson(resp)).toList();
      return statements;
    } else {
      final responseData = jsonDecode(response.body);
      throw Exception(responseData['detail']);
    }
  } catch (e) {
    throw Exception(e);
  }
}
