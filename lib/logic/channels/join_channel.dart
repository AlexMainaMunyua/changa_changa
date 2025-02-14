// ignore_for_file: non_constant_identifier_names

import 'package:changa_changa/models/channels.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChannelModel {
  String? inviteCode;
  ChannelRead? channel;
  String? firstName;
  String? phoneNumber;
  String? inviteStatus;

  ChannelModel({
    this.inviteCode,
    this.channel,
    this.firstName,
    this.phoneNumber,
    this.inviteStatus,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      inviteCode: json['invite_code'],
      channel: ChannelRead.fromJson(json['channel']),
      firstName: json['first_name'],
      phoneNumber: json['phone_number'],
      inviteStatus: json['invite_status'],
    );
  }
}

class Channel {
  String? channelId;
  double? runningBalance;
  String? videoUrl;
  String? imageUrl;
  String? description;
  String? title;
  String? accountId;
  int? total_participants;
  String? target;
  String? creator_id;
  bool? is_active;
  String? created_date_utc;
  Category? category;

  Channel({
    this.channelId,
    this.runningBalance,
    this.videoUrl,
    this.imageUrl,
    this.description,
    this.title,
    this.accountId,
    this.total_participants,
    this.target,
    this.creator_id,
    this.is_active,
    this.created_date_utc,
    this.category,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      channelId: json['channel_id'],
      runningBalance: json['running_balance'],
      videoUrl: json['video_url'],
      imageUrl: json['image_url'],
      description: json['description'],
      title: json['title'],
      accountId: json['account_id'],
      target: json['target'],
      total_participants: json['total_participants'],
      creator_id: json['creator_id'],
      is_active: json['is_active'],
      created_date_utc: json['created_date_utc'],
      category: Category.fromJson(json['category']),
    );
  }
}

class Category {
  int? id;
  String? name;
  String? displayName;

  Category({
    this.id,
    this.name,
    this.displayName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
    );
  }
}

Future<ChannelModel> fetchChannelModel(
    String inviteCode, String accessToken) async {
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/invites/$inviteCode';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  final response = await http.get(Uri.parse(url), headers: headers);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return ChannelModel.fromJson(jsonData);
  } else {
    final jsonData = jsonDecode(response.body);
    throw Exception('Error ${jsonData['detail']}');
  }
}
