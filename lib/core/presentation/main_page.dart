import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/presentation/login_page.dart';
import 'package:msn2/authentication/shared/providers.dart';
import 'package:msn2/core/presentation/loading_page.dart';
import 'package:msn2/main/presentation/user_main_page.dart';

@RoutePage()
class RedirectingPage extends ConsumerWidget {
  const RedirectingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);
    return authState.map(
      loading: (_) => const LoadingScreen(),
      unauthenticated: (_) => const LoginPage(),
      authenticated: (_) => const UserMainPage(),
    );
  }
}
