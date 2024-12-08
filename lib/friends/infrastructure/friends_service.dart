import 'package:dio/dio.dart';

class FriendsService {
  final Dio _dio;

  const FriendsService(this._dio);
  static const addFriendEndPoint = 'add_friend';
  static const removeFriendEndPoint = 'remove_friend';
  static const listFriendsEndPoint = 'list_friends';
  static const port = '8080';
  static const base = 'http://localhost:$port';

  Future<Response> addFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    final response = await _dio.post(
      '$base/$addFriendEndPoint',
      // '$base/$loginEndPoint',
      data: {
        'username': username,
        'friend_username': friendUsername,
        'token': token,
      },
    );
    return response;
  }

  Future<Response> removeFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) {
    final response = _dio.post(
      '$base/$removeFriendEndPoint',
      data: {
        'username': username,
        'friend_username': friendUsername,
        'token': token,
      },
    );
    return response;
  }

  Future<Response> listFriends({
    required String username,
    required String token,
  }) {
    final response = _dio.post(
      '$base/$listFriendsEndPoint',
      data: {},
    );
    return response;
  }
}
