import 'package:dio/dio.dart';

class AuthenticationService {
  final Dio _dio;

  const AuthenticationService(this._dio);

  Future<Response> login({
    required String username,
    required String password,
  }) {
    final response = _dio.post('');
    return response;
  }

  Future<Response> register({
    required String username,
    required String password,
    required String passwordAgain,
  }) {
    final response = _dio.post('');
    return response;
  }

  Future<Response> forgotPassword() {
    final response = _dio.post('');
    return response;
  }
}
