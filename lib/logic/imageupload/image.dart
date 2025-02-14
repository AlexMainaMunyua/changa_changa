import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../auth/reg.dart';


final _authService = AuthService();
class UploadResponse {
  String url;
  String filename;

  UploadResponse({
    required this.url,
    required this.filename,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) {
    return UploadResponse(
      url: json['url'],
      filename: json['filename'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'filename': filename,
    };
  }

  @override
  String toString() {
    return 'UploadResponse{url: $url, filename: $filename}';
  }
}

Future<UploadResponse> uplaodData(
    {required File userImage, required User user}) async {
  const url = 'https://api.changachanga.co.ke/api/v1/media/uploads';
  String apiKey = dotenv.env['API_KEY']!;

  try {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['apikey'] = apiKey;

    // Add image file to the request

    final fileStream = http.ByteStream(Stream.castFrom(userImage.openRead()));
    final fileLength = await userImage.length();

    final multipartFile = http.MultipartFile(
      'media_file',
      fileStream,
      fileLength,
      filename: userImage.path.split('/').last,
    );

    request.files.add(multipartFile);

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(responseBody);
      final imageResp = UploadResponse.fromJson(decodedResponse);
      user.profile_photo = imageResp.url;
   //   await _authService.register(user);
      return imageResp;
    } else {
      final decodedResponse = json.decode(responseBody);
      throw Exception(decodedResponse["detail"]);
    }
  } catch (e) {
    throw Exception(e);
  }
}

