// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> saveImageToStorage(File image) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  final savedImage = await image.copy('${appDir.path}/$fileName.png');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('saved_image_path', savedImage.path);
  return savedImage.path;
}

Future<String> uploadImage(File imageFile) async {
  try{
    final imagePath = await saveImageToStorage(imageFile);
    return imagePath;
  } catch (e) {
    throw Exception('Failed to upload image try again');
  }

  // var url = Uri.parse('http://example.com/upload-image');
  // var request = http.MultipartRequest('POST', url);

  // Add the image file to the request
  // var image = await http.MultipartFile.fromPath('image', imageFile.path);
  // request.files.add(image);
  //
  // // Send the request
  // var response = await request.send();
  //
  // if (response.statusCode == 200) {
  //   // The image was successfully uploaded, so return the URL
  //   var responseJson = await response.stream.bytesToString();
  //   return responseJson;
  // } else {
  //   // There was an error uploading the image, so throw an exception
  //   throw Exception('Failed to upload image: ${response.statusCode}');
  // }
}

Future<String> saveChannelImageToStorage(File image, String? title) async {
  String? topic = title;
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  final savedImage = await image.copy('${appDir.path}/$fileName.png');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('$topic', savedImage.path);
  return savedImage.path;
}

Future<String> uploadChannelImage(File imageFile, String? title) async {
  try{
    final imagePath = await saveChannelImageToStorage(imageFile, title);
    return imagePath;
  } catch (e) {
    throw Exception('Failed to upload image try again');
  }

  // var url = Uri.parse('http://example.com/upload-image');
  // var request = http.MultipartRequest('POST', url);

  // Add the image file to the request
  // var image = await http.MultipartFile.fromPath('image', imageFile.path);
  // request.files.add(image);
  //
  // // Send the request
  // var response = await request.send();
  //
  // if (response.statusCode == 200) {
  //   // The image was successfully uploaded, so return the URL
  //   var responseJson = await response.stream.bytesToString();
  //   return responseJson;
  // } else {
  //   // There was an error uploading the image, so throw an exception
  //   throw Exception('Failed to upload image: ${response.statusCode}');
  // }
}