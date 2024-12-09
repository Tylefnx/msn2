import 'package:dio/dio.dart';

class MessagesServices {
  final Dio _dio;

  const MessagesServices(this._dio);
  static const sendMessageEndPoint = 'send_message';
  static const listMessagesEndPoint = 'list_messages';
  static const listChatsEndPoint = 'list_chats';
  static const listSpecificChatEndPoint = 'list_specific_chat';
  static const port = '8080';
  static const base = 'http://localhost:$port';

  Future<Response> sendMessage({
    required String username,
    required String friendUsername,
    required String token,
    required String message,
  }) async {
    final response = await _dio.post(
      '$base/$sendMessageEndPoint',
      // '$base/$loginEndPoint',
      data: {
        'sender': username,
        'receiver': friendUsername,
        'message': message,
        'token': token,
      },
    );
    return response;
  }

  Future<Response> listMessages({
    required String username,
    required String friendUsername,
    required String token,
  }) {
    final response = _dio.post(
      '$base/$listMessagesEndPoint',
      data: {
        'username': username,
        'token': token,
      },
    );
    return response;
  }

  Future<Response> listSpecificChat({
    required String sender,
    required String receiver,
    required String token,
  }) {
    final response = _dio.post(
      '$base/$listSpecificChatEndPoint',
      data: {
        'username1': sender,
        'username2': receiver,
        'token': token,
      },
    );
    return response;
  }

  Future<Response> listChats({
    required String username,
    required String token,
  }) {
    final response = _dio.post(
      '$base/$listChatsEndPoint',
      data: {
        'username': username,
        'token': token,
      },
    );
    return response;
  }
}
