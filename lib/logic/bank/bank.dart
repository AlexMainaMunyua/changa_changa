import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class Bank {
  int? id;
  String? name;
  String? code;

  Bank({this.id, this.name, this.code});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  @override
  String toString() {
    return 'Bank(id: $id, name: $name, code: $code)';
  }
}

class BankAccount {
  String? accountNumber;
  String? verificationDocument;
  int? bankId;
  String? accountId;
  int? id;
  bool? isVerified;
  Bank? bank;

  BankAccount({
    this.accountNumber,
    this.verificationDocument,
    this.bankId,
    this.accountId,
    this.id,
    this.isVerified,
    this.bank,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      accountNumber: json['account_number'],
      verificationDocument: json['verification_document'],
      bankId: json['bank_id'],
      accountId: json['account_id'],
      id: json['id'],
      isVerified: json['is_verified'],
      bank: Bank.fromJson(json['bank']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account_number': accountNumber,
      'verification_document': verificationDocument,
      'bank_id': bankId,
      'account_id': accountId,
      'id': id,
      'is_verified': isVerified,
      'bank': bank?.toJson(),
    };
  }

  @override
  String toString() {
    return 'BankAccount(accountNumber: $accountNumber, verificationDocument: $verificationDocument, bankId: $bankId, accountId: $accountId, id: $id, isVerified: $isVerified, bank: $bank)';
  }
}

class Verification {
  String? id;
  String? verificationDocument;
  String? verifiedBy;
  int? status;
  DateTime? statusDateUtc;
  BankAccount? bankAccount;

  Verification({
    this.id,
    this.verificationDocument,
    this.verifiedBy,
    this.status,
    this.statusDateUtc,
    this.bankAccount,
  });

  factory Verification.fromJson(Map<String, dynamic> json) {
    return Verification(
      id: json['id'],
      verificationDocument: json['verification_document'],
      verifiedBy: json['verified_by'],
      status: json['status'],
      statusDateUtc: DateTime.parse(json['status_date_utc']),
      bankAccount: BankAccount.fromJson(json['bank_account']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'verification_document': verificationDocument,
      'verified_by': verifiedBy,
      'status': status,
      'status_date_utc': statusDateUtc?.toIso8601String(),
      'bank_account': bankAccount?.toJson(),
    };
  }

  @override
  String toString() {
    return 'Verification(id: $id, verificationDocument: $verificationDocument, verifiedBy: $verifiedBy, status: $status, statusDateUtc: $statusDateUtc, bankAccount: $bankAccount)';
  }
}

class BankAccountResponse {
  String? bankAccountNumber;
  String? bankBranch;
  String? verificationDocument;
  int? bankId;
  String? accountId;
  int? id;
  bool? isVerified;
  BankInfo? bank;

  BankAccountResponse({
    this.bankAccountNumber,
    this.bankBranch,
    this.verificationDocument,
    this.bankId,
    this.accountId,
    this.id,
    this.isVerified,
    this.bank,
  });

  factory BankAccountResponse.fromJson(Map<String, dynamic> json) {
    return BankAccountResponse(
      bankAccountNumber: json['account_number'],
      bankBranch: json['bank_branch'],
      verificationDocument: json['verification_document'],
      bankId: json['bank_id'],
      accountId: json['account_id'],
      id: json['id'],
      isVerified: json['is_verified'],
      bank: BankInfo.fromJson(json['bank']),
    );
  }
}

class BankInfo {
  int id;
  String name;
  String code;

  BankInfo({
    required this.id,
    required this.name,
    required this.code,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) {
    return BankInfo(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }
}

Future<Verification> postBankAccountData({
  required File verificationDocument,
  required String bankAccountNumber,
  required int bankId,
  required String branchName,
  required String accessToken,
}) async {
  const apiUrl = 'https://api.changachanga.co.ke/api/v1/payments/bank-accounts';

  try {
    final request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';

    request.fields['bank_account_number'] = bankAccountNumber;
    request.fields['bank_id'] = jsonEncode(bankId);
    request.fields['bank_branch'] = branchName;

    final fileStream =
        http.ByteStream(Stream.castFrom(verificationDocument.openRead()));
    final fileLength = await verificationDocument.length();
    final multipartFile = http.MultipartFile(
      'verification_document',
      fileStream,
      fileLength,
      filename: verificationDocument.path.split('/').last,
    );
    request.files.add(multipartFile);
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(responseBody);
      return Verification.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to post bank account data. Status code: $responseBody');
    }
  } catch (e) {
    throw Exception('Error occurred while posting bank account data: $e');
  }
}

Future<List<BankAccountResponse>> fetchBankAccountData(
    {required String accessToken}) async {
  const apiUrl = 'https://api.changachanga.co.ke/api/v1/payments/bank-accounts';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  try {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return List<BankAccountResponse>.from(
          jsonResponse.map((data) => BankAccountResponse.fromJson(data)));
    } else {
      throw Exception(
          'Failed to fetch bank account data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error occurred while fetching bank account data: $e');
  }
}

Future<BankAccount> createBankAccount(
    {String? accessToken, String? accountNumber, int? bankid}) async {
  var url =
      Uri.parse('https://api.changachanga.co.ke/api/v1/payments/bank-accounts');

  // Create a Map with the data you want to send
  var data = {
    'account_number': accountNumber,
    'bank_id': bankid,
    // Add more fields as needed
  };
  try {
    // Convert the data to JSON
    var jsonData = jsonEncode(data);

    // Make the POST request
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonData,
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Request successful
      var responseBody = jsonDecode(response.body);
      BankAccount bankAccount = BankAccount.fromJson(responseBody);
      return bankAccount;
    } else {
      // Request failed
      var responseBody = jsonDecode(response.body);
      throw Exception('Failed: ${responseBody['detail']}');
    }
  } catch (e) {
    throw Exception(e);
  }
}
