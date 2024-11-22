import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/authentication/shared/providers.dart';
import 'package:msn2/core/presentation/app_buttons.dart';
import 'package:msn2/core/presentation/app_padding.dart';
import 'package:msn2/core/presentation/app_sb_padding.dart';
import 'package:msn2/core/presentation/app_textformfield.dart';

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
        AppButton(
          onPressed: () {
            if (passwordController.text == passwordAgainController.text) {
              ref.read(authStateNotifierProvider.notifier).register(
                    username: usernameController.text,
                    password: passwordController.text,
                  );
            }
          },
          title: 'Register',
        )
      ],
    );
  }
}
