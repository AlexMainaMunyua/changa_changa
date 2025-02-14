// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:changa_changa/models/user.dart';

class ChannelRead {
  String? channel_id;
  String? account_id;
  double? runningBalance;
  String? link;
  String? goal;
  String? channelCode;
  String? videoUrl;
  String? imageUrl;
  String? description;
  String? target;
  String? title;
  String? join_link_code;
  String? payment_link_code;
  String? channel_privacy;
  File? imageFile;
  String? close_condition;
  int? category_id;
  String? creator_id;
  User? creator;
  Category? category;
  String? categ;
  int? channel_status;
  bool? is_active;
  String? created_date_utc;
  double? total_collected;
  List<Participant>? participants;

  ChannelRead({
    this.channel_id,
    this.account_id,
    this.runningBalance,
    this.link,
    this.goal,
    this.channelCode,
    this.videoUrl,
    this.imageUrl,
    this.description,
    this.category,
    this.participants,
    this.title,
    this.join_link_code,
    this.payment_link_code,
    this.channel_privacy,
    this.imageFile,
    this.target,
    this.close_condition,
    this.category_id,
    this.creator_id,
    this.creator,
    this.channel_status,
    this.is_active,
    this.categ,
    this.total_collected,
    this.created_date_utc,
  });

  factory ChannelRead.fromJson(Map<String, dynamic> json) {
    User? creator;
    List<Participant>? participantsList;
    if (json['participants'] != null) {
      var participantsJson = json['participants'] as List;
      participantsList = participantsJson
          .map((participantJson) => Participant.fromJson(participantJson))
          .toList();
    }
    if (json['creator'] != null) {
      creator = User.fromJson(json['creator']);
    }
    return ChannelRead(
      channel_id: json['channel_id'],
      runningBalance: json['running_balance'],
      link: json['link'],
      channelCode: json['code'],
      videoUrl: json['video_url'],
      imageUrl: json['image_url'],
      description: json['description'],
      title: json['title'],
      account_id: json['account_id'],
      close_condition: json['close_condition'],
      channel_privacy: json['channel_privacy'],
      category_id: json['category_id'],
      category: Category.fromJson(json['category']),
      target: json['target'],
      join_link_code: json['join_link_code'],
      payment_link_code: json['payment_link_code'],
      channel_status: json['channel_status'],
      is_active: json['is_active'],
      creator_id: json['creator_id'],
      creator: creator,
      total_collected: json['total_collected'],
      participants: participantsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channel_id': channel_id,
      'running_balance': runningBalance,
      'link': link,
      'code': channelCode,
      'video_url': videoUrl,
      'image_url': imageUrl,
      'description': description,
      'title': title,
      'account_id': account_id,
      'close_condition': close_condition,
      'channel_privacy': channel_privacy,
      'category_id': category_id,
      'category': category?.toJson(),
      'target': target,
      'created_date_utc': created_date_utc,
      'creator_id': creator_id,
      'creator': creator,
      'total_collected': total_collected,
      'participants':
          participants?.map((participant) => participant.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'ChannelRead{channel_id: $channel_id, account_id: $account_id, runningBalance: $runningBalance, link: $link, goal: $goal, channelCode: $channelCode, videoUrl: $videoUrl, imageUrl: $imageUrl, description: $description, target: $target, title: $title, channel_privacy: $channel_privacy, imageFile: $imageFile, close_condition: $close_condition, category_id: $category_id, category: $category, participants: $participants, categ: $categ}';
  }
}

class ChannelSettings {
  int id;
  int channelId;
  bool requireApproval;
  double targetAmount;
  int duration;

  ChannelSettings({
    required this.id,
    required this.channelId,
    required this.requireApproval,
    required this.targetAmount,
    required this.duration,
  });
}

class Category {
  int id;
  String name;
  String displayName;

  Category({
    required this.id,
    required this.name,
    required this.displayName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
    };
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, displayName: $displayName}';
  }
}

class Participant {
  User? user;
  bool? is_admin;

  Participant({this.user, this.is_admin});

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      user: User.fromJson(json['user']),
      is_admin: json['is_admin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'is_admin': is_admin,
    };
  }

  @override
  String toString() {
    return 'Participant{user: $user, is_admin: $is_admin}';
  }
}
