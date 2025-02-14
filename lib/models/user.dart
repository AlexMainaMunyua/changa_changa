// ignore_for_file: non_constant_identifier_names

import 'package:changa_changa/models/account.dart';

class User {
  String? id_number;
  String? nationality;
  String? id_document_type;
  String? date_of_birth;
  String? address_line;
  String? postal_code;
  String? country_code;
  String? first_name;
  String? phone_number;
  String? email_address;
  String? password;
  String? id;
  String? is_active;
  bool? is_superuser;
  String? verification_code;
  Account? account;
  String? new_password;
  String? otp;
  String? username;
  String? user_no;
  int? user_account_status;
  String? user_id;
  String? date_joined_utc;
  String? verification_request_id;
  String? profile_photo;
  String? title;
  String? request_id;

  User(
      {this.id_number,
      this.nationality,
      this.id_document_type,
      this.date_of_birth,
      this.address_line,
      this.postal_code,
      this.country_code,
      this.first_name,
      this.phone_number,
      this.email_address,
      this.password,
      this.id,
      this.account,
      this.verification_code,
      this.otp,
      this.new_password,
      this.username,
      this.user_no,
      this.user_account_status,
      this.date_joined_utc,
      this.user_id,
      this.verification_request_id,
      this.profile_photo,
      this.title,
      this.request_id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id_number: json['id_number'],
        id: json['id'],
        nationality: json['nationality'],
        first_name: json['first_name'],
        id_document_type:
            json['id_document_type'], //lastName: json['lastName'],
        phone_number: json['phone_number'],
        email_address: json['email_address'],
        date_of_birth: json['date_of_birth'],
        address_line: json['address_line'],
        country_code: json['country_code'],
        postal_code: json['postal_code'],
        password: json['password'],
        verification_code: json['verification_code'],
        otp: json['otp'],
        new_password: json['new_password'],
        username: json['username'],
        user_no: json['user_no'],
        user_account_status: json['user_account_status'],
        date_joined_utc: json['date_joined_utc'],
        user_id: json['user_id'],
        verification_request_id: json['verification_request_id'],
        profile_photo: json['profile_photo'],
        request_id: json['request_id'],
        title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id_number': id_number,
      'id': id,
      'nationality': nationality,
      'first_name': first_name,
      'id_document_type': id_document_type,
      'phone_number': phone_number,
      'email_address': email_address,
      'date_of_birth': date_of_birth,
      'address_line': address_line,
      'country_code': country_code,
      'postal_code': postal_code,
      'password': password,
      'verification_code': verification_code,
      'otp': otp,
      'new_password': new_password,
      'username': username,
      'user_no': user_id,
      'user_account_status': user_account_status,
      'date_joined_utc': date_joined_utc,
      'user_id': user_id,
      'verification_request_id': verification_request_id,
      'profile_photo': profile_photo,
      'request_id': request_id,
      'title': title
    };
  }

  @override
  String toString() {
    return 'User{id_number: $id_number, nationality: $nationality, id_document_type: $id_document_type, date_of_birth: $date_of_birth, address_line: $address_line, postal_code: $postal_code, country_code: $country_code, first_name: $first_name, phone_number: $phone_number, email_address: $email_address, password: $password, id: $id, is_active: $is_active, is_superuser: $is_superuser, verification_code: $verification_code, account: $account, new_password: $new_password, otp: $otp, username: $username, user_no: $user_no, user_account_status: $user_account_status, user_id: $user_id, date_joined_utc: $date_joined_utc, title: $title}';
  }
}
