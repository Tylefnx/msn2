import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:msn2/messages/domain/message.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String sender,
    required String receiver,
    required List<Message>? messages,
  }) = _Message;

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}
