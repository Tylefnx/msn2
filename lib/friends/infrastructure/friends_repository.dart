import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:msn2/authentication/domain/auth_failure.dart';
import 'package:msn2/friends/infrastructure/friends_service.dart';

class FriendsRepository {
  final FriendsService _service;

  const FriendsRepository(this._service);

  Future<Either<AuthFailure, List<String>>> listUsers() async {
    try {
      final response = await _service.listUsers();
      print(response);
      final json = response.data as List<Map<String, String>>;
      var userList = <String>[];
      for (final u in json) {
        userList.add(u['username']!);
      }

      return Right(userList);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, List<String>>> listFriends({
    required String username,
    required String token,
  }) async {
    try {
      final response = await _service.listFriends(
        username: username,
        token: token,
      );
      final json = response.data as Map<String, dynamic>;
      final friendsList = json['friends'] as List<String>;

      return Right(friendsList);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, String>> addFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    try {
      final response = await _service.addFriend(
        username: username,
        token: token,
        friendUsername: friendUsername,
      );
      final json = response.data as Map<String, dynamic>;
      final message = json['message'] as String;

      return Right(message);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, String>> removeFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    try {
      final response = await _service.removeFriend(
        username: username,
        token: token,
        friendUsername: friendUsername,
      );
      final json = response.data as Map<String, dynamic>;
      final message = json['message'] as String;

      return Right(message);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }
}
