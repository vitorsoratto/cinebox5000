import 'package:cinebox5000/ui/core/themes/theme.dart';
import 'package:cinebox5000/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinebox',
      theme: AppTheme.theme,
      routes: {
        '/': (context) => const SplashScreen(),
      },
    );
  }
}
