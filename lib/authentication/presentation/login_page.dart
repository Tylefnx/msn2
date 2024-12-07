import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/shared/providers.dart';
import 'package:msn2/core/presentation/app_buttons.dart';
import 'package:msn2/core/presentation/app_padding.dart';
import 'package:msn2/core/presentation/app_sb_padding.dart';
import 'package:msn2/core/presentation/app_text.dart';
import 'package:msn2/core/presentation/app_textformfield.dart';
import 'package:msn2/core/router/app_router.dart';

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
  const _LoginWidget();

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
        SB_AppPadding.h30(),
        Row(
          children: [
            AppText.bold(text: "If you don't have an account"),
            TextButton(
              onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                const RegisterRoute(),
                predicate: (_) => false,
              ),
              child: AppText.bold(text: 'create one'),
            ),
          ],
        ),
        SB_AppPadding.h30(),
        AppButton(
          onPressed: () {
            ref.read(authStateNotifierProvider.notifier).login(
                  username: usernameController.text,
                  password: passwordController.text,
                );
            AutoRouter.of(context).pushAndPopUntil(
              const RedirectingRoute(),
              predicate: (_) => false,
            );
          },
          title: 'Login',
        ),
      ],
    );
  }
}
