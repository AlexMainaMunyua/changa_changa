// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:changa_changa/logic/auth/reg.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:my_app/user.dart';

import '../../models/account.dart';
import '../../models/user.dart';

class ApiService {
  static final User _userData = User();
  static Account? _userAccount;
  final storage = const FlutterSecureStorage();

  static const _storage = FlutterSecureStorage();

  static Future<void> _deleteToken() async {
    await _storage.delete(key: 'jwt_token');
  }

  static Future<List<Channels>?> authenticateUser({
    required String otp,
    String? user_id,
    required String req_id,
  }) async {
    const url = 'https://api.changachanga.co.ke/api/v1/otp-login';
    _userData.otp = otp;
    _userData.user_id = user_id;
    List<dynamic>? userChannelListData;
    List<Channels>? userActiveChannels;
    String apiKey = dotenv.env['API_KEY']!;
    final headers = {
      'Content-Type': 'application/json',
      'apikey': apiKey,
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(_userData.toJson()),
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _userData.phone_number = responseBody['data']['username'].toString();
        _userData.first_name = responseBody['data']['first_name'].toString();
        _userData.is_active = responseBody['data']['is_active'].toString();
        _userData.title = responseBody['data']['title'].toString();
        _userData.profile_photo =
            responseBody['data']['profile_photo'].toString();
        if (responseBody['data']['is_active']) {
          _userAccount?.account_no =
              responseBody['data']['accounts'][0]['account_id'];
          _userAccount?.account_type =
              responseBody['data']['accounts'][0]['account_type'];
          _userAccount?.is_verified =
              responseBody['data']['accounts'][0]['is_verified'];
          SharedPreferences prefs = await SharedPreferences.getInstance();

          if (responseBody['access_token'] != null) {
            await prefs.setString('access_token', responseBody['access_token']);
            userChannelListData =
                await userChannelList(responseBody['access_token']);
          }
          final authService = AuthService().userGetKycDetails(responseBody['access_token']);
       //   await authService.userGetKycDetails(responseBody['access_token']);
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
          await prefs.setString('account_type',
              responseBody['data']['accounts'][0]['account_type']);

          if (_userAccount?.account_no != null) {
            await prefs.setString(
                'account_no', _userAccount!.account_no.toString());
          }
          if (_userData.profile_photo != null ||
              _userData.profile_photo == 'null') {
            await prefs.setString(
                'profile_photo', _userData.profile_photo.toString());
          }
          if (_userData.title != null || _userData.title != 'null') {
            await prefs.setString('title', _userData.title.toString());
          }
          userActiveChannels = userChannelListData
              ?.map((item) => Channels.fromJson(item))
              .toList();
          return userActiveChannels;
        } else {
          throw Exception("Inactive user");
        }
      } else {
        final responseBody = json.decode(response.body);
        throw Exception(responseBody['detail']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> deleteUserData() async {
    await _deleteToken();
    await _storage.delete(key: 'user_details');
  }
}
