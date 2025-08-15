import 'dart:developer';

import 'package:cinebox5000/core/result/result.dart';
import 'package:cinebox5000/data/exceptions/data_exception.dart';
import 'package:cinebox5000/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox5000/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

const GOOGLE_LOCAL_STORAGE_KEY = 'google_id_token';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSigninService _googleSigninService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSigninService googleSigninService,
  }) : _localStorageService = localStorageService,
       _googleSigninService = googleSigninService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getData(
      GOOGLE_LOCAL_STORAGE_KEY,
    );

    return switch (resultToken) {
      Success<String>() => Success(true),
      Failure<String>() => Success(false),
      _ => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSigninService.signIn();

    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveData(GOOGLE_LOCAL_STORAGE_KEY, value);
        return successOfUnit();
      case Failure<String>(:final error):
        log(
          'Sign in failed: $error',
          name: 'AuthRepositoryImpl.signIn',
          error: error,
        );
        return Failure(DataException(message: 'Sign in with Google failed.'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSigninService.signOut();

    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.deleteData(
          GOOGLE_LOCAL_STORAGE_KEY,
        );
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log(
              'Failed to remove local storage data: $error',
              name: 'AuthRepositoryImpl.signOut',
              error: error,
            );
            return Failure(error);
        }
      case Failure<Unit>(:final error):
        log(
          'Sign out failed: $error',
          name: 'AuthRepositoryImpl.signOut',
          error: error,
        );
        return Failure(DataException(message: 'Sign out failed.'));
    }
  }
}
