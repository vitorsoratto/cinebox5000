import 'package:cinebox5000/core/result/result.dart';
import 'package:cinebox5000/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_google_command.g.dart';

@riverpod
class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() {
    return AsyncValue.data(null);
  }

  Future<void> execute() async {
    state = const AsyncLoading();
    try {
      final authRepository = ref.read(authRepositoryProvider);
      final result = await authRepository.signIn();

      switch (result) {
        case Success<Unit>():
          state = const AsyncData(null);
          break;
        case Failure<Unit>():
          state = AsyncError(result.error, StackTrace.current);
          break;
      }

      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
