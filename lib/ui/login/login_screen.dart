import 'package:cinebox5000/ui/core/themes/resource.dart';
import 'package:cinebox5000/ui/login/commands/login_with_google_command.dart';
import 'package:cinebox5000/ui/login/login_viewmodel.dart';
import 'package:cinebox5000/ui/login/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
          ),
          Positioned.fill(
            top: 110,
            child: Column(
              children: [
                Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final viewModel = ref.read(loginViewmodelProvider);
                      final state = ref.watch(loginWithGoogleCommandProvider);

                      return SignInGoogleButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          viewModel.googleLogin();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
