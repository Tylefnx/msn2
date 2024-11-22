import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/shared/providers.dart';
import 'package:msn2/core/presentation/app_buttons.dart';
import 'package:msn2/core/presentation/app_padding.dart';
import 'package:msn2/core/presentation/app_sb_padding.dart';
import 'package:msn2/core/presentation/app_textformfield.dart';

@RoutePage(name: 'LoginRoute')
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPadding.h30v40(
        child: const _LoginWidget(),
      ),
    );
  }
}

class _LoginWidget extends HookConsumerWidget {
  const _LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextformfield.normalText(
          controller: usernameController,
          label: 'Username',
        ),
        SB_AppPadding.h30(),
        AppTextformfield.privateText(
          controller: passwordController,
          label: 'Password',
        ),
        AppButton(
          onPressed: () => ref.read(authStateNotifierProvider.notifier).login(
                username: usernameController.text,
                password: passwordController.text,
              ),
          title: 'Login',
        ),
      ],
    );
  }
}
