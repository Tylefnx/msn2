import 'package:dio/dio.dart';

class FriendsService {
  final Dio _dio;

  const FriendsService(this._dio);
  static const addFriendEndPoint = 'add_friend';
  static const removeFriendEndPoint = 'remove_friend';
  static const respondFriendEndPoint = 'respond_friend';
  static const listFriendsEndPoint = 'list_friends';
  static const listFriendRequestsEndPoint = 'list_friend_requests';
  static const listUsersEndPoint = 'list_users';
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

  Future<Response> respondFriend({
    required String username,
    required String friendUsername,
    required String token,
    required int answer,
  }) {
    final response = _dio.post(
      '$base/$respondFriendEndPoint',
      data: {
        'requestee': username,
        'requester': friendUsername,
        'response': answer,
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
      data: {
        'username': username,
        'token': token,
      },
    );
    return response;
  }

  Future<Response> listFriendRequests({
    required String username,
    required String token,
  }) {
    final response = _dio.post(
      '$base/$listFriendsEndPoint',
      data: {
        'username': username,
        'token': token,
      },
    );
    return response;
  }

  Future<Response> listUsers() {
    final response = _dio.post(
      '$base/$listUsersEndPoint',
      data: {},
    );
    return response;
  }
}
