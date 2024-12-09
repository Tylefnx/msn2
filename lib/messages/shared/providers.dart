import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/shared/providers.dart';
import 'package:msn2/messages/application/messages_notifier.dart';
import 'package:msn2/messages/infrastructure/messages_repository.dart';
import 'package:msn2/messages/infrastructure/messages_services.dart';

final messageServiceProvider = Provider(
  (ref) => MessagesServices(dio),
);

final messageRepoProvider = Provider(
  (ref) => MessageRepository(
    ref.watch(messageServiceProvider),
  ),
);

final messageStateNotifierProvider =
    StateNotifierProvider<MessageStateNotifier, MessageState>(
  (ref) => MessageStateNotifier(
    ref.watch(messageRepoProvider),
  ),
);
