import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request.freezed.dart';
part 'friend_request.g.dart';

@freezed
class FriendRequest with _$FriendRequest {
  const factory FriendRequest({
    required String requester,
    required String requestee,
    required int status,
  }) = _FriendRequest;

  factory FriendRequest.fromJson(Map<String, Object?> json) =>
      _$FriendRequestFromJson(json);
}
