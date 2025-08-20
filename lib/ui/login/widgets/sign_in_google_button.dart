import 'package:flutter/material.dart';

class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({
    super.key,
    this.onPressed,
    required this.isLoading,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: !isLoading,
            replacement: SizedBox(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(
                strokeWidth: 1,
                color: Colors.black,
              ),
            ),
            child: Image.asset(
              'assets/images/google_logo.png',
              height: 42,
              width: 42,
            ),
          ),
          const SizedBox(width: 8),
          Text(isLoading ? 'Signing in' : 'Sign in with Google'),
        ],
      ),
    );
  }
}
