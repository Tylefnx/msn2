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

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPadding.h30v40(
        child: const _RegisterWidget(),
      ),
    );
  }
}

class _RegisterWidget extends HookConsumerWidget {
  const _RegisterWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordAgainController = useTextEditingController();
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
        AppTextformfield.privateText(
          controller: passwordAgainController,
          label: 'Password Again',
        ),
        SB_AppPadding.h30(),
        Row(
          children: [
            AppText.bold(text: "If you have an account"),
            TextButton(
              onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                const RedirectingRoute(),
                predicate: (_) => false,
              ),
              child: AppText.bold(text: 'Log in'),
            ),
          ],
        ),
        SB_AppPadding.h30(),
        AppButton(
          onPressed: _onPressedRegister(
            password: passwordController,
            passwordAgain: passwordAgainController,
            username: usernameController,
            ref: ref,
            context: context,
          ),
          title: 'Register',
        ),
      ],
    );
  }
}

void Function() _onPressedRegister({
  required TextEditingController password,
  required TextEditingController passwordAgain,
  required TextEditingController username,
  required WidgetRef ref,
  required BuildContext context,
}) {
  return () async {
    if (password.text == passwordAgain.text) {
      final state = ref.watch(authStateNotifierProvider);
      await ref.read(authStateNotifierProvider.notifier).register(
            username: username.text,
            password: password.text,
          );
      state.maybeMap(
        unauthenticated: (_) {
          final error = _.failure?.error;
          if (error == null) {
            ref.read(authStateNotifierProvider.notifier).login(
                  username: username.text,
                  password: password.text,
                );
            AutoRouter.of(context).pushAndPopUntil(
              const RedirectingRoute(),
              predicate: (_) => false,
            );
          }
        },
        orElse: () {},
      );
    }
  };
}
