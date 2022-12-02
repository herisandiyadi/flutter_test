import 'dart:convert';

import 'package:test_flutter/constants/string.dart';
import 'package:test_flutter/test_api/models/users_response.dart';
import 'package:http/http.dart' as http;

abstract class UserRepositoryImpl {
  Future<UserResponse> getUser();
}

class UserRepository implements UserRepositoryImpl {
  @override
  Future<UserResponse> getUser() async {
    final response = await http.get(Uri.parse('$baseUrl/api/users?page=1'));
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final json = UserResponse.fromJson(jsonResponse);
      return json;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
