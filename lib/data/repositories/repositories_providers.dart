import 'package:cinebox5000/data/repositories/auth/auth_repository.dart';
import 'package:cinebox5000/data/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox5000/data/services/services_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    localStorageService: ref.read(localStorageServiceProvider),
    googleSigninService: ref.read(googleSigninServiceProvider),
  );
}
