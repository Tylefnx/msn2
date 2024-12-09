// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FriendsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)
        failed,
    required TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult? Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticated value) failed,
    required TResult Function(_Authenticated value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnAuthenticated value)? failed,
    TResult? Function(_Authenticated value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticated value)? failed,
    TResult Function(_Authenticated value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsStateCopyWith<$Res> {
  factory $FriendsStateCopyWith(
          FriendsState value, $Res Function(FriendsState) then) =
      _$FriendsStateCopyWithImpl<$Res, FriendsState>;
}

/// @nodoc
class _$FriendsStateCopyWithImpl<$Res, $Val extends FriendsState>
    implements $FriendsStateCopyWith<$Res> {
  _$FriendsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'FriendsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)
        failed,
    required TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult? Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticated value) failed,
    required TResult Function(_Authenticated value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnAuthenticated value)? failed,
    TResult? Function(_Authenticated value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticated value)? failed,
    TResult Function(_Authenticated value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends FriendsState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$UnAuthenticatedImplCopyWith<$Res> {
  factory _$$UnAuthenticatedImplCopyWith(_$UnAuthenticatedImpl value,
          $Res Function(_$UnAuthenticatedImpl) then) =
      __$$UnAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AuthFailure? failure,
      List<String> users,
      List<String> friends,
      List<FriendRequest> friendRequests});

  $AuthFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$UnAuthenticatedImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$UnAuthenticatedImpl>
    implements _$$UnAuthenticatedImplCopyWith<$Res> {
  __$$UnAuthenticatedImplCopyWithImpl(
      _$UnAuthenticatedImpl _value, $Res Function(_$UnAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
    Object? users = null,
    Object? friends = null,
    Object? friendRequests = null,
  }) {
    return _then(_$UnAuthenticatedImpl(
      freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendRequests: null == friendRequests
          ? _value._friendRequests
          : friendRequests // ignore: cast_nullable_to_non_nullable
              as List<FriendRequest>,
    ));
  }

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $AuthFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$UnAuthenticatedImpl extends _UnAuthenticated {
  const _$UnAuthenticatedImpl(this.failure,
      {required final List<String> users,
      required final List<String> friends,
      required final List<FriendRequest> friendRequests})
      : _users = users,
        _friends = friends,
        _friendRequests = friendRequests,
        super._();

  @override
  final AuthFailure? failure;
  final List<String> _users;
  @override
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<String> _friends;
  @override
  List<String> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<FriendRequest> _friendRequests;
  @override
  List<FriendRequest> get friendRequests {
    if (_friendRequests is EqualUnmodifiableListView) return _friendRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendRequests);
  }

  @override
  String toString() {
    return 'FriendsState.failed(failure: $failure, users: $users, friends: $friends, friendRequests: $friendRequests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnAuthenticatedImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._friendRequests, _friendRequests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      failure,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_friendRequests));

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnAuthenticatedImplCopyWith<_$UnAuthenticatedImpl> get copyWith =>
      __$$UnAuthenticatedImplCopyWithImpl<_$UnAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)
        failed,
    required TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)
        loaded,
  }) {
    return failed(failure, users, friends, friendRequests);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult? Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
  }) {
    return failed?.call(failure, users, friends, friendRequests);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure, users, friends, friendRequests);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticated value) failed,
    required TResult Function(_Authenticated value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnAuthenticated value)? failed,
    TResult? Function(_Authenticated value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticated value)? failed,
    TResult Function(_Authenticated value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticated extends FriendsState {
  const factory _UnAuthenticated(final AuthFailure? failure,
          {required final List<String> users,
          required final List<String> friends,
          required final List<FriendRequest> friendRequests}) =
      _$UnAuthenticatedImpl;
  const _UnAuthenticated._() : super._();

  AuthFailure? get failure;
  List<String> get users;
  List<String> get friends;
  List<FriendRequest> get friendRequests;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnAuthenticatedImplCopyWith<_$UnAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String> users,
      List<String> friends,
      List<FriendRequest> friendRequests});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? friends = null,
    Object? friendRequests = null,
  }) {
    return _then(_$AuthenticatedImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendRequests: null == friendRequests
          ? _value._friendRequests
          : friendRequests // ignore: cast_nullable_to_non_nullable
              as List<FriendRequest>,
    ));
  }
}

/// @nodoc

class _$AuthenticatedImpl extends _Authenticated {
  const _$AuthenticatedImpl(
      {required final List<String> users,
      required final List<String> friends,
      required final List<FriendRequest> friendRequests})
      : _users = users,
        _friends = friends,
        _friendRequests = friendRequests,
        super._();

  final List<String> _users;
  @override
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<String> _friends;
  @override
  List<String> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<FriendRequest> _friendRequests;
  @override
  List<FriendRequest> get friendRequests {
    if (_friendRequests is EqualUnmodifiableListView) return _friendRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendRequests);
  }

  @override
  String toString() {
    return 'FriendsState.loaded(users: $users, friends: $friends, friendRequests: $friendRequests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._friendRequests, _friendRequests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_friendRequests));

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)
        failed,
    required TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)
        loaded,
  }) {
    return loaded(users, friends, friendRequests);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult? Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
  }) {
    return loaded?.call(users, friends, friendRequests);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AuthFailure? failure, List<String> users,
            List<String> friends, List<FriendRequest> friendRequests)?
        failed,
    TResult Function(List<String> users, List<String> friends,
            List<FriendRequest> friendRequests)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(users, friends, friendRequests);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_UnAuthenticated value) failed,
    required TResult Function(_Authenticated value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UnAuthenticated value)? failed,
    TResult? Function(_Authenticated value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_UnAuthenticated value)? failed,
    TResult Function(_Authenticated value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Authenticated extends FriendsState {
  const factory _Authenticated(
      {required final List<String> users,
      required final List<String> friends,
      required final List<FriendRequest> friendRequests}) = _$AuthenticatedImpl;
  const _Authenticated._() : super._();

  List<String> get users;
  List<String> get friends;
  List<FriendRequest> get friendRequests;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
