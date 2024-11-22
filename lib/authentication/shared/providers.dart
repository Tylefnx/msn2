import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/application/authentication_notifier.dart';
import 'package:msn2/authentication/infrastructure/authentication_repository.dart';
import 'package:msn2/authentication/infrastructure/authentication_service.dart';

final dio = Dio();

final authServiceProvider = Provider(
  (ref) => AuthenticationService(dio),
);

final authRepoProvider = Provider(
  (ref) => AuthenticationRepository(
    ref.watch(authServiceProvider),
  ),
);

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(
    ref.watch(authRepoProvider),
  ),
);
