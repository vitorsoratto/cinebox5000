import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_command.g.dart';

@riverpod
class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  @override
  Future<bool?> build() async {
    return null;
  }

  void execute() async {
    state = AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncData(false);
  }
}
