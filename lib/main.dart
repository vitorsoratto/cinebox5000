import 'package:cinebox5000/cinebox_main_app.dart';
import 'package:cinebox5000/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSignIn.instance.initialize(serverClientId: Env.googleApiKey);

  runApp(ProviderScope(child: const CineboxMainApp()));
}
