import 'package:cinebox5000/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderAndMessages<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Theme.of(context).colorScheme.primary,
            size: 50.0,
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void showErrorSnackBar(String message) =>
      _showSnackBar(message, AppColors.redColor);

  void showSuccessSnackBar(String message) =>
      _showSnackBar(message, Colors.green);

  void showInfoSnackBar(String message) => _showSnackBar(message, Colors.blue);
}
