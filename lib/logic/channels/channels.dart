// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:changa_changa/models/userInvite.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/channels.dart';

class Channels {
  final String? channel_id;
  final double? runningBalance;
  final String? link;
  final String? code;
  final String? imageUrl;
  final String? description;
  final String? title;
  final bool? is_active;
  Category? category;
  final String? account_id;
  final int? channel_status;
  final String? status_reason;

  Channels({
    this.channel_id,
    this.runningBalance,
    this.link,
    this.code,
    this.imageUrl,
    this.description,
    this.title,
    this.is_active,
    this.category,
    this.account_id,
    this.channel_status,
    this.status_reason,
  });

  factory Channels.fromJson(Map<String, dynamic> json) {
    return Channels(
        channel_id: json['channel_id'],
        runningBalance: json['running_balance'],
        link: json['link'],
        code: json['code'],
        imageUrl: json['image_url'],
        description: json['description'],
        title: json['title'],
        is_active: json['is_active'],
        account_id: json['account_id'],
        category: Category.fromJson(json['category']),
        channel_status: json['channel_status'],
        status_reason: json['status_reason']);
  }

  @override
  String toString() {
    return 'Channels{channel_id: $channel_id, runningBalance: $runningBalance, link: $link, code: $code, imageUrl: $imageUrl, description: $description, title: $title, is_active: $is_active, account_id: $account_id, channel_status: $channel_status, status_reason: $status_reason}';
  }
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
    return 'Category{id: $id, name: $name, displayname: $displayName}';
  }
}

Future<List<dynamic>> userChannelList(String accessToken) async {
  const url = 'https://api.changachanga.co.ke/api/v1/channels/';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody;
    } else {
      throw Exception('Something went wrong');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<void> chanelUserlList(String accessToken, String channelNo) async {
  final channel_number = channelNo;
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channel_number/participants';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<ChannelRead> readChannel(String channelNo, String accessToken) async {
  final channel_number = channelNo;
  final url = 'https://api.changachanga.co.ke/api/v1/channels/$channel_number';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      ChannelRead chanData = ChannelRead.fromJson(responseBody);
      List<Participant>? pats =
          await channelParticipant(channelNo, accessToken);
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

Future<void> getChannelInvites(String accessToken, String channelNo) async {
  final channel_number = channelNo;
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channel_number/invites';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  try {
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final otp = responseBody['verification_code'];
      return otp;
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<void> contributeToChannel(String accessToken, String channelNo) async {
  const url = 'https://api.changachanga.co.ke/api/v1/joinchanel/code';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken'
  };
  final response = await http.post(Uri.parse(url), headers: headers);
  try {
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final otp = responseBody['verification_code'];
      return otp;
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<ChannelRead> createChannel(
    ChannelRead? channelData, String accessToken) async {
  const url = 'https://api.changachanga.co.ke/api/v1/channels/';

  try {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';

    // Add channel_name and channel_description as fields
    request.fields['channel_title'] = channelData!.title!;
    request.fields['channel_description'] = channelData.description!;
    request.fields['category_id'] = jsonEncode(channelData.category_id);
    if (channelData.target != null) {
      request.fields['target_amount'] =
          jsonEncode(int.parse(channelData.target!));
    }
    // Add image file to the request
    if (channelData.imageFile != null) {
      final fileStream =
          http.ByteStream(Stream.castFrom(channelData.imageFile!.openRead()));
      final fileLength = await channelData.imageFile!.length();

      final multipartFile = http.MultipartFile(
        'image',
        fileStream,
        fileLength,
        filename: channelData.imageFile!.path.split('/').last,
      );

      request.files.add(multipartFile);
    }

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final responseBodyDecode = json.decode(responseBody);
      ChannelRead chanData = ChannelRead.fromJson(responseBodyDecode);
      List<Participant>? pats =
          await channelParticipant(chanData.channel_id!, accessToken);
      chanData.participants = pats;
      return chanData;
    } else {
      final decodedResponse = json.decode(responseBody);
      throw Exception(decodedResponse["detail"]);
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<void> channelData(String channelNo, String accessToken) async {
  final channel_number = channelNo;
  final url = 'https://api.changachanga.co.ke/api/v1/channels/$channel_number';
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<Participant>?> channelParticipant(
    String channelNo, String accessToken) async {
  final channel_number = channelNo;
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channel_number/participants';
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Participant>? participantsList;
      if (responseBody != null) {
        var participantsJson = responseBody as List;
        participantsList = participantsJson
            .map((participantJson) => Participant.fromJson(participantJson))
            .toList();
      }
      return participantsList;
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<void> invaitechannnelPartisipants(String channelNo, String accessToken,
    List<UserInvited> participants) async {
  final channel_number = channelNo;
  final url =
      'https://api.changachanga.co.ke/api/v1/channels/$channelNo/invite-participants';
  UserInviteList userlist = UserInviteList(userlist: participants);
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: json.encode(userlist.userlist),
    );
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
    } else {
      final responseBody = json.decode(response.body);
      throw Exception('error ${responseBody['detail'][0]['msg']}');
    }
  } catch (e) {
    throw Exception(e);
  }
}

class ChannelEntry {
  String? invite_code;
  String? channel_id;

  ChannelEntry({
    this.invite_code,
    this.channel_id,
  });
  factory ChannelEntry.fromJson(Map<String, dynamic> json) {
    return ChannelEntry(
      invite_code: json['invite_code'],
      channel_id: json['channel_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'invite_code': invite_code,
      'channel_id': channel_id,
    };
  }

  @override
  String toString() {
    return 'ChannelEntry{invite_code: $invite_code, channel_number: $channel_id}';
  }
}

Future<void> joinChannel(
    {required String code,
    required String accessToken,
    required String channel_id}) async {
  final channel_code = code;
  final channel_number = channel_id;
  final url = 'https://api.changachanga.co.ke/api/v1/channels/$channel_id/join';
  ChannelEntry? entry =
      ChannelEntry(invite_code: channel_code, channel_id: channel_number);
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(entry.toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
    } else {
      final responseBody = json.decode(response.body);
      throw Exception(responseBody['detail']);
    }
  } catch (e) {
    throw Exception(e);
  }
}

Future<void> removeParticipant(
    String accessToken, String channelId, String userId) async {
  final apiUrl =
      'https://api.changachanga.co.ke/api/v1/channels/$channelId/remove-participant/$userId';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Successful request
    } else {
      // Error handling
      final responseBody = json.decode(response.body);
      throw Exception('Error ${responseBody['detail']}');
    }
  } catch (e) {
    // Exception handling
    throw Exception(e);
  }
}

Future<void> leaveChannel(String accessToken, String channelId) async {
  final apiUrl =
      'https://api.changachanga.co.ke/api/v1/channels/$channelId/leave';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Successful request
    } else {
      // Error handling
      final responseBody = json.decode(response.body);
      throw Exception('Error ${responseBody['detail']}');
    }
  } catch (e) {
    // Exception handling
    throw Exception(e);
  }
}

Future<void> archiveChannel(String accessToken, String channelId) async {
  final apiUrl =
      'https://api.changachanga.co.ke/api/v1/channels/$channelId/archive';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  try {
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      // Successful request
    } else {
      // Error handling
      final responseBody = json.decode(response.body);
      throw Exception('Error ${responseBody['detail']}');
    }
  } catch (e) {
    // Exception handling
    throw Exception(e);
  }
}

Future<ChannelRead> channelPatData(
    {String? channelNo, String? accessToken}) async {
  final channel_number = channelNo;
  final url = 'https://api.changachanga.co.ke/api/v1/channels/$channel_number';
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return ChannelRead.fromJson(responseBody);
    } else {
      final responseBody = json.decode(response.body);
      throw Exception('Error ${responseBody['detail']}');
    }
  } catch (e) {
    throw Exception(e);
  }
}
