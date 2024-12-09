import 'dart:convert';

import 'package:dio/dio.dart';

class AuthenticationService {
  final Dio _dio;

  const AuthenticationService(this._dio);
  static const loginEndPoint = 'login';
  static const registerEndPoint = 'register';
  static const port = '8080';
  static const base = 'http://localhost:$port';

  Future<Response> login({
    required String username,
    required String password,
  }) async {
    final response = _dio.post(
      '$base/$loginEndPoint',
      data: jsonEncode('{"username": "tayfun", "password": "anan"}'),
    );
    return response;
  }

  Future<Response> register({
    required String username,
    required String password,
  }) {
    final response = _dio.post(
      '$base/$registerEndPoint',
      data: {
        'username': username,
        'password': password,
      },
    );
    return response;
  }
}
