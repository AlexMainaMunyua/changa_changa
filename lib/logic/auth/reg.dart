import 'dart:convert';
import 'package:changa_changa/models/idotp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/account.dart';
import '../../models/kyc.dart';
import '../../models/user.dart';
//import 'user.dart';

class AuthService {
  static const baseUrl = 'https://api.changachanga.co.ke';
  final User _userData = User();
  Account? _userAccount;
  final storage = const FlutterSecureStorage();

  Future<bool> userGetKycDetails(String? accessToken) async {
    const url = '$baseUrl/api/v1/users/me';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final verificationStatus = responseBody['accounts'][0]['is_verified'];
        if (verificationStatus) {
          return true;
        } else {
          return false;
        }
      } else {
        final responseBody = json.decode(response.body);
        throw Exception(responseBody["detail"]);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> register(User user) async {
    const url = 'https://api.changachanga.co.ke/api/v1/users/';
    String apiKey = dotenv.env['API_KEY']!;
    final headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey,
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(user.toJson()),
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _userData.phone_number = responseBody['username'].toString();
        _userData.id = responseBody['user_no'].toString();
        _userData.profile_photo = responseBody['profile_photo'].toString();
        _userData.first_name = responseBody['username'].toString();
        _userData.is_active = responseBody['user_account_status'].toString();
        _userData.title = responseBody['title'].toString();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (_userData.phone_number != null ||
            _userData.phone_number == 'null') {
          await prefs.setString(
              'phone_number', _userData.phone_number.toString());
        }
        if (_userData.id != null || _userData.id == 'null') {
          await prefs.setString('id', _userData.id.toString());
        }
        if (_userData.first_name != null || _userData.first_name == 'null') {
          await prefs.setString('full_name', _userData.first_name.toString());
        }
        if (_userData.is_active != null || _userData.is_active == 'null') {
          await prefs.setString('is_active', _userData.is_active.toString());
        }
        if (_userData.title != null || _userData.title == 'null') {
          await prefs.setString('title', _userData.title.toString());
        }
        if (_userData.profile_photo != null ||
            _userData.profile_photo == 'null') {
          await prefs.setString(
              'profile_photo', _userData.profile_photo.toString());
        }
      } else {
        final responseBody = json.decode(response.body);
        throw Exception(responseBody["detail"]);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> kyc(KycUserModel user, String accessToken) async {
    const url = '$baseUrl/api/v1/users/me/upload-kyc';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(user.toJson()),
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        String status =
        responseBody['verification_response']['success'].toString();
        if (status == "true") {
          userGetKycDetails(accessToken);
          return;
        } else {
          throw Exception("Failed to validate");
        }
      } else {
        final responseBody = json.decode(response.body);
        throw Exception(responseBody["detail"]);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> phoneValidation(String phone) async {
    const url = 'https://api.changachanga.co.ke/api/v1/send-verify-code';
    String apiKey = dotenv.env['API_KEY']!;
    final headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey,
    };
    _userData.phone_number = '+$phone';
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(_userData.toJson()),
    );
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['message'] == "SUCCESS") {
        return "done";
      } else {
        throw Exception('Failed to send verification code');
      }
    } else {
      throw Exception('Failed to send verification code');
    }
  }

  Future<void> otp(String phone, String otp) async {
    final url = 'https://api.changachanga.co.ke/api/v1/$phone/verify';
    String apiKey = dotenv.env['API_KEY']!;
    final headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey,
    };
    _userData.phone_number = phone;
    _userData.verification_code = otp;
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(_userData.toJson()),
    );
    try {
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _userData.phone_number =
            responseBody['data']['data']['username'].toString();
        _userData.id = responseBody['data']['data']['user_no'].toString();
        _userData.first_name =
            responseBody['data']['data']['first_name'].toString();
        _userData.is_active =
            responseBody['data']['data']['user_account_status'].toString();
        _userData.profile_photo =
            responseBody['data']['data']['profile_photo'].toString();
        _userAccount?.account_no =
            responseBody['data']['data']['account'][0]['account_no'].toString();
        _userAccount?.account_type = responseBody['data']['data']['account'][0]
        ['account_type']
            .toString();
        _userAccount?.is_verified = responseBody['data']['data']['account'][0]
        ['is_verified']
            .toString();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (responseBody['data']['access_token'] != null) {
          await prefs.setString(
              'access_token', responseBody['data']['access_token']);
        }
        if (_userData.phone_number != null) {
          await prefs.setString(
              'phone_number', _userData.phone_number.toString());
        }
        if (_userData.id != null) {
          await prefs.setString('id', _userData.id.toString());
        }
        if (_userData.first_name != null) {
          await prefs.setString('full_name', _userData.first_name.toString());
        }
        if (_userData.is_active != null) {
          await prefs.setString('is_active', _userData.is_active.toString());
        }
        if (_userData.profile_photo != null ||
            _userData.profile_photo == 'null') {
          await prefs.setString(
              'profile_photo', _userData.profile_photo.toString());
        }
        // if(_userAccount?.account_no != null){
        //   await prefs.setString('account_no', _userAccount!.account_no.toString());
        // }
        // if(_userAccount?.account_type != null){
        //   await prefs.setString('account_type', _userAccount!.account_type.toString());
        // }
        // if( _userAccount?.is_verified!= null){
        //   await prefs.setString('is_verified', _userAccount!.is_verified.toString());
        // }
      } else {
        final body = json.decode(response.body);
        throw Exception(body['detail']);
      }
    } catch (e) {
      throw Exception('Failed to register user $e');
    }
  }

  Future<void> ForgotPassword(
      String phone,
      ) async {
    const url = '$baseUrl/api/v1/forget-password';
    String apiKey = dotenv.env['API_KEY']!;
    final headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey,
    };
    _userData.phone_number = phone;
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(_userData.toJson()),
    );
    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      final responseBody = json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<void> ResetPassword(
      String phone, String otp, String newPassword) async {
    const url = '$baseUrl/api/v1/reset-password';
    String apiKey = dotenv.env['API_KEY']!;
    final headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey,
    };
    _userData.phone_number = phone;
    _userData.otp = otp;
    _userData.new_password = newPassword;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(_userData.toJson()),
      );
      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        final responseBody = json.decode(response.body);
      } else {
        final responseBody = json.decode(response.body);
        throw Exception(responseBody['detail']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

Future<UserOtp> loginOtp(String id) async {
  const url = 'https://api.changachanga.co.ke/api/v1/send-otp';
  final User userData = User();
  String apiKey = dotenv.env['API_KEY']!;
  final headers = {
    'Content-Type': 'application/json',
    'apikey': apiKey,
  };
  userData.id_number = id;
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(userData.toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['message'] == "SUCCESS") {
        UserOtp resp = UserOtp.fromJson(responseBody);
        return resp;
      } else {
        throw Exception(responseBody['message']);
      }
    } else {
      final responseBody = json.decode(response.body);
      throw Exception(responseBody['detail']);
    }
  } catch (e) {
    throw Exception(e);
  }
}