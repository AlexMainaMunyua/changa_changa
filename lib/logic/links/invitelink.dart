import 'dart:convert';

import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:http/http.dart' as http;

Future<ChannelRead> generateJoinLink(
    {String? channelId, String? accessToken}) async {
  var url = Uri.parse(
      'https://api.changachanga.co.ke/api/v1/channels/$channelId/join-link/generate');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    var response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      // Request successful
      final responseBody = json.decode(response.body);
      ChannelRead chanData = ChannelRead.fromJson(responseBody);
      List<Participant>? pats =
          await channelParticipant(channelId!, accessToken!);
      chanData.participants = pats;
      return chanData;
    } else {
      // Request failed
      final responseBody = json.decode(response.body);
      throw Exception('Error ${responseBody['detail']}');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<ChannelRead> revokeJoinLink(
    {String? channelId, String? accessToken}) async {
  final url = Uri.parse(
      'https://api.changachanga.co.ke/api/v1/channels/$channelId/join-link/revoke');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };

  try {
    final response = await http.delete(url, headers: headers);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      ChannelRead chanData = ChannelRead.fromJson(responseBody);
      List<Participant>? pats =
          await channelParticipant(channelId!, accessToken!);
      chanData.participants = pats;
      return chanData;
    } else {
      final responseBody = json.decode(response.body);
      throw Exception('Error ${responseBody['detail']}');
    }
  } catch (e) {
    throw Exception(e);
  }
}
