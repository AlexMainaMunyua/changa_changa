
class PaymentRequest {
  String requestId;
  double amount;
  String paymentMethod;
  Map<String, dynamic> requestPayload;
  Map<String, dynamic> paymentRequestResult;
  Map<String, dynamic> paymentCallbackResult;
  String requestStatus;
  String channelId;
  String userId;

  PaymentRequest({
    required this.requestId,
    required this.amount,
    required this.paymentMethod,
    required this.requestPayload,
    required this.paymentRequestResult,
    required this.paymentCallbackResult,
    required this.requestStatus,
    required this.channelId,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'amount': amount,
      'payment_method': paymentMethod,
      'request_payload': requestPayload,
      'payment_request_result': paymentRequestResult,
      'payment_callback_result': paymentCallbackResult,
      'request_status': requestStatus,
      'channel_id': channelId,
      'user_id': userId,
    };
  }

  factory PaymentRequest.fromJson(Map<String, dynamic> json) {
    return PaymentRequest(
      requestId: json['request_id'],
      amount: json['amount'],
      paymentMethod: json['payment_method'],
      requestPayload: json['request_payload'],
      paymentRequestResult: json['payment_request_result'],
      paymentCallbackResult: json['payment_callback_result'],
      requestStatus: json['request_status'],
      channelId: json['channel_id'],
      userId: json['user_id'],
    );
  }
}

