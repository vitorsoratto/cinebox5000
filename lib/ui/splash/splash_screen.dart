import 'package:cinebox5000/ui/core/themes/resource.dart';
import 'package:cinebox5000/ui/core/widgets/loader_messages.dart';
import 'package:cinebox5000/ui/splash/commands/check_user_logged_command.dart';
import 'package:cinebox5000/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderAndMessages {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider).checkLoginAndRedirect();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkUserLoggedCommandProvider, (_, next) {
      next.whenOrNull(
        data: (data) {
          final path = switch (data) {
            true => '/home',
            false => '/login',
            _ => '',
          };

          if (path.isNotEmpty && context.mounted) {
            Navigator.of(context).pushReplacementNamed(path);
          }
        },
        error: (error, stackTrace) {
          if (context.mounted) {
            showErrorSnackBar('Erro ao realizar login');
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
      );
    });

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
          Center(
            child: Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
          ),
        ],
      ),
    );
  }
}
