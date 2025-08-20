import 'package:cinebox5000/ui/login/commands/login_with_google_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

class LoginViewmodel {
  final LoginWithGoogleCommand _loginWithGoogleCommand;

  LoginViewmodel({required LoginWithGoogleCommand loginWithGoogleCommand})
    : _loginWithGoogleCommand = loginWithGoogleCommand;

  void googleLogin() => _loginWithGoogleCommand.execute();
}

@riverpod
LoginViewmodel loginViewmodel(Ref ref) {
  final loginWithGoogleCommand = ref.watch(
    loginWithGoogleCommandProvider.notifier,
  );

  return LoginViewmodel(loginWithGoogleCommand: loginWithGoogleCommand);
}
