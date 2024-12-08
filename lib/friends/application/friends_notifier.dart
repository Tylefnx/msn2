import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/domain/auth_failure.dart';
import 'package:msn2/friends/infrastructure/friends_repository.dart';

part 'friends_notifier.freezed.dart';

@freezed
class FriendsState with _$FriendsState {
  const FriendsState._();
  const factory FriendsState.loading() = _Loading;
  const factory FriendsState.failed(
    AuthFailure? failure, {
    required List<String> users,
    required List<String> friends,
  }) = _UnAuthenticated;
  const factory FriendsState.loaded({
    required List<String> users,
    required List<String> friends,
  }) = _Authenticated;
}

class FriendsNotifier extends StateNotifier<FriendsState> {
  final FriendsRepository _repository;
  FriendsNotifier(this._repository) : super(const FriendsState.loading());

  Future<void> listUsers({
    required String username,
    required String password,
  }) async {
    state = const FriendsState.loading();
    final loginOrFailure = await _repository.listUsers();

    final friendsList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.friends,
      failed: (_) => _.friends,
    );
    state = loginOrFailure.fold(
      (l) =>
          FriendsState.failed(l, users: const <String>[], friends: friendsList),
      (r) => FriendsState.loaded(users: r, friends: friendsList),
    );
  }

  Future<void> listFriends({
    required String username,
    required String token,
  }) async {
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.listFriends(
      username: username,
      token: token,
    );
    state = const FriendsState.loading();

    final userList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.users,
      failed: (_) => _.users,
    );
    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: const <String>[],
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: r,
      ),
    );
  }

  Future<void> addFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.addFriend(
      username: username,
      token: token,
      friendUsername: friendUsername,
    );
    state = const FriendsState.loading();

    final userList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.users,
      failed: (_) => _.users,
    );
    final friendList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.friends,
      failed: (_) => _.friends,
    );
    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendList,
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendList,
      ),
    );
  }

  Future<void> removeFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.removeFriend(
      username: username,
      token: token,
      friendUsername: friendUsername,
    );
    state = const FriendsState.loading();

    final userList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.users,
      failed: (_) => _.users,
    );
    final friendList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.friends,
      failed: (_) => _.friends,
    );
    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendList,
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendList,
      ),
    );
  }
}
