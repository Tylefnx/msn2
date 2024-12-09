import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/application/authentication_notifier.dart';
import 'package:msn2/authentication/infrastructure/authentication_repository.dart';
import 'package:msn2/authentication/infrastructure/authentication_service.dart';

final dio = Dio(
  BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'connection': 'keep-alive',
    },
  ),
);

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
