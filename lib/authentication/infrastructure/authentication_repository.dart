import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:msn2/authentication/domain/auth_failure.dart';
import 'package:msn2/authentication/infrastructure/authentication_service.dart';

class AuthenticationRepository {
  final AuthenticationService _service;

  const AuthenticationRepository(this._service);

  Future<Either<AuthFailure, String>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _service.login(
        username: username,
        password: password,
      );
      print(response);
      final json = response.data as Map;
      return Right(json['token'].toString());
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, String>> register({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _service.register(
        username: username,
        password: password,
      );
      final status = response.data['message'] as String;
      print(status);

      return Right(status);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }
}
