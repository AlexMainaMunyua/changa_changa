import 'package:http/http.dart' as http;
import 'dart:convert';

Future<UserCreator> fetchUserCreator(
    {required String accessToken, required String userId}) async {
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  final response = await http.get(
    Uri.parse('https://api.changachanga.co.ke/api/v1/users/$userId'),
    headers: headers,
  );
  if (response.statusCode == 200) {
    // API call successful
    final jsonData = json.decode(response.body);
    return UserCreator.fromJson(jsonData);
  } else {
    // API call failed
    throw Exception('Failed to fetch user');
  }
}

class UserCreator {
  final String firstName;
  final String username;
  final String emailAddress;
  final String phoneNumber;
  final bool isActive;
  final String userId;
  final String profilePhoto;
  final String dateJoinedUtc;
  final List<Account> accounts;

  UserCreator({
    required this.firstName,
    required this.username,
    required this.emailAddress,
    required this.phoneNumber,
    required this.isActive,
    required this.userId,
    required this.profilePhoto,
    required this.dateJoinedUtc,
    required this.accounts,
  });

  factory UserCreator.fromJson(Map<String, dynamic> json) {
    return UserCreator(
      firstName: json['first_name'],
      username: json['username'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
      isActive: json['is_active'],
      userId: json['user_id'],
      profilePhoto: json['profile_photo'],
      dateJoinedUtc: json['date_joined_utc'],
      accounts: List<Account>.from(
          json['accounts'].map((account) => Account.fromJson(account))),
    );
  }
}

class Account {
  final String accountName;
  final String accountType;
  final String accountId;
  final bool isVerified;
  final String verificationStatusId;
  final Address address;
  final KycProfile kycProfile;

  Account({
    required this.accountName,
    required this.accountType,
    required this.accountId,
    required this.isVerified,
    required this.verificationStatusId,
    required this.address,
    required this.kycProfile,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountName: json['account_name'],
      accountType: json['account_type'],
      accountId: json['account_id'],
      isVerified: json['is_verified'],
      verificationStatusId: json['verification_status_id'],
      address: Address.fromJson(json['address']),
      kycProfile: KycProfile.fromJson(json['kyc_profile']),
    );
  }
}

class Address {
  final String country;
  final String accountId;
  final bool isDeleted;
  final String addressLine;
  final String city;

  Address({
    required this.country,
    required this.accountId,
    required this.isDeleted,
    required this.addressLine,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json['country'],
      accountId: json['account_id'],
      isDeleted: json['is_deleted'],
      addressLine: json['address_line'],
      city: json['city'],
    );
  }
}

class KycProfile {
  final String fullName;
  final String idDateOfIssue;
  final String idNumber;
  final String idDocumentType;
  final String dateOfBirth;
  final String nationality;
  final String gender;

  KycProfile({
    required this.fullName,
    required this.idDateOfIssue,
    required this.idNumber,
    required this.idDocumentType,
    required this.dateOfBirth,
    required this.nationality,
    required this.gender,
  });

  factory KycProfile.fromJson(Map<String, dynamic> json) {
    return KycProfile(
      fullName: json['full_name'],
      idDateOfIssue: json['id_date_of_issue'],
      idNumber: json['id_number'],
      idDocumentType: json['id_document_type'],
      dateOfBirth: json['date_of_birth'],
      nationality: json['nationality'],
      gender: json['gender'],
    );
  }
}
