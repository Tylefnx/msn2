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

class FriendsStateNotifier extends StateNotifier<FriendsState> {
  final FriendsRepository _repository;
  FriendsStateNotifier(this._repository) : super(const FriendsState.loading());

  List<String> getFriendsList() {
    final friendsList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.friends,
      failed: (_) => _.friends,
    );
    return friendsList;
  }

  List<String> getUsers() {
    final friendsList = state.maybeMap(
      orElse: () => <String>[],
      loaded: (_) => _.users,
      failed: (_) => _.users,
    );
    return friendsList;
  }

  List<FriendRequest> getfriendRequests() {
    final friendRequests = state.maybeMap(
      orElse: () => <FriendRequest>[],
      loaded: (_) => _.friendRequests,
      failed: (_) => _.friendRequests,
    );
    return friendRequests;
  }

  Future<void> listUsers({
    required String username,
    required String password,
  }) async {
    final userList = getUsers();
    final friendsList = getFriendsList();
    final friendRequests = getfriendRequests();
    state = const FriendsState.loading();
    final loginOrFailure = await _repository.listUsers();

    state = loginOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
      (r) => FriendsState.loaded(
        users: r,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
    );
  }

  Future<void> listFriends({
    required String username,
    required String token,
  }) async {
    final userList = getUsers();
    final friendsList = getFriendsList();
    final friendRequests = getfriendRequests();
    state = const FriendsState.loading();
    final friendsOrFailure = await _repository.listFriends(
      username: username,
      token: token,
    );
    state = const FriendsState.loading();

    state = await friendsOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: r,
        friendRequests: friendRequests,
      ),
    );
  }

  Future<void> addFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    final userList = getUsers();
    final friendsList = getFriendsList();
    final friendRequests = getfriendRequests();
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.addFriend(
      username: username,
      token: token,
      friendUsername: friendUsername,
    );
    state = const FriendsState.loading();
    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
    );
  }

  Future<void> listFriendRequests({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    final userList = getUsers();
    final friendsList = getFriendsList();
    final friendRequests = getfriendRequests();
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.listFriendRequests(
      username: username,
      token: token,
    );
    state = const FriendsState.loading();

    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendsList,
        friendRequests: r,
      ),
    );
  }

  Future<void> removeFriend({
    required String username,
    required String friendUsername,
    required String token,
  }) async {
    final userList = getUsers();
    final friendRequests = getfriendRequests();
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.removeFriend(
      username: username,
      token: token,
      friendUsername: friendUsername,
    );
    await listFriends(username: username, token: token);
    final friendsList = getFriendsList();
    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
    );
  }

  Future<void> respondFriend({
    required String username,
    required String friendUsername,
    required String token,
    required int answer,
  }) async {
    final userList = getUsers();
    state = const FriendsState.loading();
    final registerOrFailure = await _repository.respondFriend(
      username: username,
      token: token,
      friendUsername: friendUsername,
      answer: answer,
    );
    await listFriends(username: username, token: token);
    await listFriendRequests(
      username: username,
      friendUsername: friendUsername,
      token: token,
    );
    final friendsList = getFriendsList();
    final friendRequests = getfriendRequests();
    state = const FriendsState.loading();
    await listFriends(username: username, token: token);

    state = await registerOrFailure.fold(
      (l) => FriendsState.failed(
        l,
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
      (r) => FriendsState.loaded(
        users: userList,
        friends: friendsList,
        friendRequests: friendRequests,
      ),
    );
  }
}
