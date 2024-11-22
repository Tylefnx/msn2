import 'package:dio/dio.dart';

class AuthenticationService {
  final Dio _dio;

  const AuthenticationService(this._dio);
  static const loginEndPoint = '/login';
  static const registerEndPoint = '/register';
  static const port = '8080';
  static const base = 'localhost:$port';
  Future<Response> login({
    required String username,
    required String password,
  }) {
    final response = _dio.post(
      '$base$loginEndPoint',
      data: {
        'username': username,
        'password': password,
      },
    );
    return response;
  }

  Future<Response> register({
    required String username,
    required String password,
  }) {
    final response = _dio.post(
      '$base$loginEndPoint',
      data: {
        'username': username,
        'password': password,
      },
    );
    return response;
  }

  Future<Response> forgotPassword() {
    final response = _dio.post(
      '$base$loginEndPoint',
      data: {},
    );
    return response;
  }
}
