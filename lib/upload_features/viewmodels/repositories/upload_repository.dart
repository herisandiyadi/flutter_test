import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_flutter/upload_features/models/upload_response.dart';

abstract class UploadRepositoryImpl {
  Future<UploadResponse> uploadFile(File file);
}

class UploadRepository implements UploadRepositoryImpl {
  @override
  Future<UploadResponse> uploadFile(File file) async {
    final url = Uri.parse('https://thumbsnap.com/api/upload');
    final request = http.MultipartRequest(
      'POST',
      url,
    );
    final multipartFile = await http.MultipartFile.fromPath('media', file.path);
    request.fields.addAll({'key': '000026351aa72313ddaaf27e278e9513'});
    request.files.add(multipartFile);
    final response = await request.send();
    final jsonResponse = await response.stream.bytesToString();

    final json = UploadResponse.fromJson(jsonDecode(jsonResponse));
    return json;
  }
}
