import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:msn2/authentication/domain/auth_failure.dart';
import 'package:msn2/messages/domain/chat.dart';
import 'package:msn2/messages/domain/message.dart';
import 'package:msn2/messages/infrastructure/messages_services.dart';

class MessageRepository {
  final MessagesServices _service;

  const MessageRepository(this._service);

  Future<Either<AuthFailure, String>> sendMessage({
    required String username,
    required String friendUsername,
    required String token,
    required String message,
  }) async {
    try {
      final response = await _service.sendMessage(
        username: username,
        friendUsername: friendUsername,
        token: token,
        message: message,
      );
      final json = response.data as Map<String, dynamic>;
      return Right(json['message'] as String);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, List<Message>>> listMessages({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    try {
      final response = await _service.listMessages(
        username: username,
        friendUsername: friendUsername,
        token: token,
      );
      final json = response.data as List<Map<String, dynamic>>;
      final messageList = json.map((e) => Message.fromJson(e)).toList();

      return Right(messageList);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, Chat>> listSpecificChat({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    try {
      final response = await _service.listSpecificChat(
        sender: username,
        receiver: friendUsername,
        token: token,
      );
      final json = response.data as List<Map<String, dynamic>>;
      final messageList = json.map((e) => Message.fromJson(e)).toList();
      final chat = Chat(
        sender: username,
        receiver: friendUsername,
        messages: messageList,
      );
      return Right(chat);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, List<Chat>>> listChats({
    required String username,
    required String token,
  }) async {
    try {
      final response = await _service.listChats(
        token: token,
        username: username,
      );
      final json = response.data as List<Map<String, dynamic>>;
      final chatList = json.map((e) => Chat.fromJson(e)).toList();

      return Right(chatList);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }
}
