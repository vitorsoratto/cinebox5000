import 'package:cinebox5000/ui/splash/commands/check_user_logged_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

class SplashViewModel {
  final CheckUserLoggedCommand _checkUserLoggedCommand;

  SplashViewModel(this._checkUserLoggedCommand);

  void checkLoginAndRedirect() => _checkUserLoggedCommand.execute();
}

@riverpod
SplashViewModel splashViewModel(Ref ref) {
  final checkUserLoggedCommand = ref.read(
    checkUserLoggedCommandProvider.notifier,
  );

  return SplashViewModel(checkUserLoggedCommand);
}
