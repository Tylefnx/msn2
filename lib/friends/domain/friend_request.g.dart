// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendRequestImpl _$$FriendRequestImplFromJson(Map<String, dynamic> json) =>
    _$FriendRequestImpl(
      requester: json['requester'] as String,
      requestee: json['requestee'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$FriendRequestImplToJson(_$FriendRequestImpl instance) =>
    <String, dynamic>{
      'requester': instance.requester,
      'requestee': instance.requestee,
      'status': instance.status,
    };
