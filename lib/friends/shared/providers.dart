import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/shared/providers.dart';
import 'package:msn2/friends/application/friends_notifier.dart';
import 'package:msn2/friends/infrastructure/friends_repository.dart';
import 'package:msn2/friends/infrastructure/friends_service.dart';

final friendsServiceProvider = Provider(
  (ref) => FriendsService(dio),
);

final friendsRepoProvider = Provider(
  (ref) => FriendsRepository(
    ref.watch(friendsServiceProvider),
  ),
);

final friendsStateNotifierProvider =
    StateNotifierProvider<FriendsStateNotifier, FriendsState>(
  (ref) => FriendsStateNotifier(
    ref.watch(friendsRepoProvider),
  ),
);
