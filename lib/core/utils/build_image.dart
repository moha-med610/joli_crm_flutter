import 'package:dio/dio.dart';

Future<MultipartFile> buildImage(String path) async {
  return MultipartFile.fromFile(path, filename: path.split('/').last);
}
