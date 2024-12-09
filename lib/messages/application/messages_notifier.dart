import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/domain/auth_failure.dart';
import 'package:msn2/messages/domain/chat.dart';
import 'package:msn2/messages/domain/message.dart';
import 'package:msn2/messages/infrastructure/messages_repository.dart';

part 'messages_notifier.freezed.dart';

@freezed
class MessageState with _$MessageState {
  const MessageState._();
  const factory MessageState.loading() = _Loading;
  const factory MessageState.failed(
    AuthFailure? failure, {
    required List<Message> messages,
    required List<Chat> chats,
    required Chat chat,
  }) = _Failed;
  const factory MessageState.loaded({
    required List<Message> messages,
    required List<Chat> chats,
    required Chat chat,
  }) = _Loaded;
}

class MessageStateNotifier extends StateNotifier<MessageState> {
  final MessageRepository _repository;
  MessageStateNotifier(this._repository) : super(const MessageState.loading());

  List<Message> getMessagesForState() {
    final messages = state.maybeMap(
      orElse: () => <Message>[],
      loaded: (_) => _.messages,
      failed: (_) => _.messages,
    );
    return messages;
  }

  List<Chat> getChatsForState() {
    final chats = state.maybeMap(
      orElse: () => <Chat>[],
      loaded: (_) => _.chats,
      failed: (_) => _.chats,
    );
    return chats;
  }

  Chat getCurrentChatForState() {
    final chat = state.maybeMap(
      orElse: () => const Chat(
        sender: '',
        receiver: '',
        messages: <Message>[],
      ),
      loaded: (_) => _.chat,
      failed: (_) => _.chat,
    );
    return chat;
  }

  Future<void> sendMessage({
    required String username,
    required String friendName,
    required String message,
    required String token,
  }) async {
    final messages = getMessagesForState();
    final chats = getChatsForState();
    final chat = getCurrentChatForState();
    state = const MessageState.loading();
    final messageOrFailure = await _repository.sendMessage(
      username: username,
      friendUsername: friendName,
      token: token,
      message: message,
    );
    state = messageOrFailure.fold(
      (l) => MessageState.failed(
        l,
        messages: messages,
        chats: chats,
        chat: chat,
      ),
      (r) => MessageState.loaded(
        messages: messages,
        chats: chats,
        chat: chat,
      ),
    );
  }

  Future<void> listMessages({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    final messages = getMessagesForState();
    final chats = getChatsForState();
    final chat = getCurrentChatForState();
    state = const MessageState.loading();
    final messagesOrFailure = await _repository.listMessages(
      username: username,
      friendUsername: friendUsername,
      token: token,
    );
    state = await messagesOrFailure.fold(
      (l) => MessageState.failed(
        l,
        messages: messages,
        chats: chats,
        chat: chat,
      ),
      (r) => MessageState.loaded(
        messages: r,
        chats: chats,
        chat: chat,
      ),
    );
  }

  Future<void> listChats({
    required String username,
    required String token,
  }) async {
    final messages = getMessagesForState();
    final chats = getChatsForState();
    final chat = getCurrentChatForState();
    state = const MessageState.loading();
    final messagesOrFailure = await _repository.listChats(
      username: username,
      token: token,
    );
    state = await messagesOrFailure.fold(
      (l) => MessageState.failed(
        l,
        messages: messages,
        chats: chats,
        chat: chat,
      ),
      (r) => MessageState.loaded(
        messages: messages,
        chats: r,
        chat: chat,
      ),
    );
  }

  Future<void> listSpecificChat({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    final messages = getMessagesForState();
    final chats = getChatsForState();
    final chat = getCurrentChatForState();
    state = const MessageState.loading();
    final messagesOrFailure = await _repository.listSpecificChat(
      username: username,
      token: token,
      friendUsername: friendUsername,
    );
    state = await messagesOrFailure.fold(
      (l) => MessageState.failed(
        l,
        messages: messages,
        chats: chats,
        chat: chat,
      ),
      (r) => MessageState.loaded(
        messages: messages,
        chats: chats,
        chat: r,
      ),
    );
  }
}
