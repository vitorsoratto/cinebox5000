import 'package:cinebox5000/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox5000/data/services/google_signin/google_signin_service_impl.dart';
import 'package:cinebox5000/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox5000/data/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_providers.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(
    flutterSecureStorage: const FlutterSecureStorage(),
  );
}

@riverpod
GoogleSigninService googleSigninService(Ref ref) {
  return GoogleSigninServiceImpl();
}
