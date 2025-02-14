// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestModel {
  String? requestId;
  double? amount;
  String? paymentMethod;
  String? requestStatus;
  String? channelId;
  String? userId;
  dynamic paymentRequestResult;
  DateTime? createdDateUtc;

  RequestModel({
    this.requestId,
    this.amount,
    this.paymentMethod,
    this.requestStatus,
    this.channelId,
    this.userId,
    this.paymentRequestResult,
    this.createdDateUtc,
  });

  RequestModel.fromJson(Map<String, dynamic> json) {
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
    return 'RequestModel{requestId: $requestId, amount: $amount, paymentMethod: $paymentMethod, requestStatus: $requestStatus, channelId: $channelId, userId: $userId, paymentRequestResult: $paymentRequestResult, createdDateUtc: $createdDateUtc}';
  }
}

Future<String?> paymentNotofication(
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
