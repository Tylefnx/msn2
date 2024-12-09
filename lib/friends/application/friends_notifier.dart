import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/domain/auth_failure.dart';
import 'package:msn2/friends/domain/friend_request.dart';
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
    required List<FriendRequest> friendRequests,
  }) = _UnAuthenticated;
  const factory FriendsState.loaded({
    required List<String> users,
    required List<String> friends,
    required List<FriendRequest> friendRequests,
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

    final friendRequests = state.maybeMap(
      orElse: () {},
      loaded: (value) => value.friendRequests,
      failed: (value) => value.friendRequests,
    );

    state = loginOrFailure.fold(
      (l) => FriendsState.failed(l,
          users: const <String>[],
          friends: friendsList,
          friendRequests: friendRequests ?? <FriendRequest>[]),
      (r) => FriendsState.loaded(
          users: r,
          friends: friendsList,
          friendRequests: friendRequests ?? <FriendRequest>[]),
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

    final friendRequests = state.maybeMap(
      orElse: () {},
      loaded: (value) => value.friendRequests,
      failed: (value) => value.friendRequests,
    );

    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: const <String>[],
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: const <String>[],
        friendRequests: friendRequests ?? <FriendRequest>[],
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

    final friendRequests = state.maybeMap(
      orElse: () {},
      loaded: (value) => value.friendRequests,
      failed: (value) => value.friendRequests,
    );
    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendList,
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendList,
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
    );
  }

  Future<void> listFriendRequests({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.listFriendRequests(
      username: username,
      token: token,
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

    final friendRequests = state.maybeMap(
      orElse: () {},
      loaded: (value) => value.friendRequests,
      failed: (value) => value.friendRequests,
    );
    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendList,
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendList,
        friendRequests: friendRequests ?? <FriendRequest>[],
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

    final friendRequests = state.maybeMap(
      orElse: () {},
      loaded: (value) => value.friendRequests,
      failed: (value) => value.friendRequests,
    );

    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendList,
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendList,
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
    );
  }

  Future<void> respondFriend({
    required String username,
    required String friendUsername,
    required String token,
    required int answer,
  }) async {
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.respondFriend(
      username: username,
      token: token,
      friendUsername: friendUsername,
      answer: answer,
    );
    state = const FriendsState.loading();

    final userList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.users,
      failed: (_) => _.users,
    );

    final friendRequests = state.maybeMap(
      orElse: () {},
      loaded: (value) => value.friendRequests,
      failed: (value) => value.friendRequests,
    );

    final friendList = state.maybeMap(
      orElse: () {},
      loaded: (value) => value.friends,
      failed: (value) => value.friends,
    );
    await listFriends(username: username, token: token);

    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendList ?? <String>[],
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendList ?? <String>[],
        friendRequests: friendRequests ?? <FriendRequest>[],
      ),
    );
  }
}
