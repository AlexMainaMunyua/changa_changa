// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class Payment {
  final String transactionType;
  final double amount;
  final String reason;
  final String paymentReferenceId;
  final String transactionId;
  final User user;
  final String channelId;
  final DateTime timestampUtc;

  Payment({
    required this.transactionType,
    required this.amount,
    required this.reason,
    required this.paymentReferenceId,
    required this.transactionId,
    required this.user,
    required this.channelId,
    required this.timestampUtc,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
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
  final String firstName;
  final String username;
  String? emailAddress;
  final String phoneNumber;
  final bool isActive;
  final String userId;
  final String title;
  final DateTime dateJoinedUtc;

  User({
    required this.firstName,
    required this.username,
    this.emailAddress,
    required this.phoneNumber,
    required this.isActive,
    required this.userId,
    required this.title,
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
      title: json['title'],
      dateJoinedUtc: DateTime.parse(json['date_joined_utc']),
    );
  }
}

Future<List<Payment>> fetchPaymentAndUserData(
    String channelNumber, String accessToken, int? limit) async {
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channelNumber/contributions';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Payment> paymentList = [];
      for (var json in jsonList) {
        Payment paymentRequest = Payment.fromJson(json);

        paymentList.add(paymentRequest);
      }

      return paymentList;
    } else {
      throw Exception('Failed to fetch payment requests');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<User> fetchUserData(String userId, String accessToken) async {
  final url = 'https://api.changachanga.co.ke/api/v1/users/$userId';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch user data');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<Payment>> fetchPaymentAndUserDataPaginated(
    int page, int limit, String channelNumber, String accessToken) async {
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channelNumber/contributions?page=$page&limit=$limit';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  final response = await http.get(Uri.parse(url), headers: headers);
  try {
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Payment> paymentList = [];

      for (var json in jsonList) {
        Payment paymentRequest = Payment.fromJson(json);

        paymentList.add(paymentRequest);
      }

      return paymentList;
    } else {
      throw Exception('Failed to fetch payment requests');
    }
  } catch (e) {
    throw Exception(e);
  }
}

class ContributionData {
  double amount;
  String currency;
  MpesaPaymentDetails? mpesaDetails;
  CardPaymentDetails? cardDetails;
  String paymentMethod;

  ContributionData({
    required this.amount,
    required this.currency,
    this.mpesaDetails,
    this.cardDetails,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'amount': amount,
      'currency': currency,
      'mpesa_details': mpesaDetails?.toJson(),
      'card_details': cardDetails?.toJson(),
      'payment_method': paymentMethod,
    };
    if (json['payment_method'] != 'MPESA') {
      json.remove('mpesa_details');
      String? expMonth = json['card_details']['card_exp_month'];
      if (expMonth != null) {
        json['card_details']['card_exp_month'] = expMonth.padLeft(2, '0');
      }
    }
    return json;
  }
}

class MpesaPaymentDetails {
  String accountNumber;

  MpesaPaymentDetails({required this.accountNumber});

  Map<String, dynamic> toJson() {
    return {
      'account_number': accountNumber,
    };
  }
}

class CardPaymentDetails {
  String cardNumber;
  String cardExpMonth;
  String cardExpYear;
  String cardCvv;

  CardPaymentDetails({
    required this.cardNumber,
    required this.cardExpMonth,
    required this.cardExpYear,
    required this.cardCvv,
  });

  Map<String, dynamic> toJson() {
    return {
      'card_number': cardNumber,
      'card_exp_month': cardExpMonth,
      'card_exp_year': cardExpYear,
      'card_cvv': cardCvv,
    };
  }
}

class MyModel {
  Data? data;
  String? statusUrl;

  MyModel({this.data, this.statusUrl});

  MyModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    statusUrl = json['status_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data?.toJson();
    data['status_url'] = statusUrl;
    return data;
  }

  @override
  String toString() {
    return 'MyModel{data: $data, statusUrl: $statusUrl}';
  }
}

class Data {
  String? requestId;
  double? amount;
  String? paymentMethod;
  String? requestStatus;
  String? channelId;
  String? userId;
  dynamic paymentRequestResult;
  DateTime? createdDateUtc;

  Data(
      {this.requestId,
      this.amount,
      this.paymentMethod,
      this.requestStatus,
      this.channelId,
      this.userId,
      this.paymentRequestResult,
      this.createdDateUtc});

  Data.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    amount = json['amount'];
    paymentMethod = json['payment_method'];
    requestStatus = json['request_status'];
    channelId = json['channel_id'];
    userId = json['user_id'];
    paymentRequestResult = json['payment_request_result'];
    createdDateUtc = DateTime.parse(json['created_date_utc']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['request_id'] = requestId;
    data['amount'] = amount;
    data['payment_method'] = paymentMethod;
    data['request_status'] = requestStatus;
    data['channel_id'] = channelId;
    data['user_id'] = userId;
    data['payment_request_result'] = paymentRequestResult;
    data['created_date_utc'] = createdDateUtc?.toIso8601String();
    return data;
  }

  @override
  String toString() {
    return 'Data{requestId: $requestId, amount: $amount, paymentMethod: $paymentMethod, requestStatus: $requestStatus, channelId: $channelId, userId: $userId, paymentRequestResult: $paymentRequestResult, createdDateUtc: $createdDateUtc}';
  }
}

Future<MyModel> contributeToChannel({
  required double amount,
  required String currency,
  required String accountNumber,
  required String paymentMethod,
  required String channel_id,
  required String access_token,
}) async {
  final contributionData = ContributionData(
    amount: amount,
    currency: currency,
    mpesaDetails: MpesaPaymentDetails(accountNumber: accountNumber),
    paymentMethod: paymentMethod,
  );
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channel_id/contribute'; // Replace with your actual URL

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $access_token'
  };

  final body = jsonEncode(contributionData.toJson());
  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return MyModel.fromJson(responseData);
    } else {
      final responseData = jsonDecode(response.body);
      throw Exception(responseData['detail']);
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<MyModel> contributeToChannelViaMasterCard({
  required double amount,
  required String currency,
  required String card_number,
  required String card_exp_month,
  required String card_exp_year,
  required String card_cvv,
  required String paymentMethod,
  required String channel_id,
  required String access_token,
}) async {
  final contributionData = ContributionData(
    amount: amount,
    currency: currency,
    cardDetails: CardPaymentDetails(
        cardNumber: card_number,
        cardExpMonth: card_exp_month,
        cardExpYear: '20$card_exp_year',
        cardCvv: card_cvv),
    paymentMethod: paymentMethod,
  );

  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channel_id/contribute'; // Replace with your actual URL

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $access_token'
  };

  final body = jsonEncode(contributionData.toJson());
  final response =
      await http.post(Uri.parse(url), headers: headers, body: body);
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    return MyModel.fromJson(responseData);
  } else {
    final responseData = jsonDecode(response.body);
    throw Exception(responseData['detail']);
  }
}
