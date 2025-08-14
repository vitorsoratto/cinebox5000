import 'dart:developer';

import 'package:cinebox5000/core/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './google_signin_service.dart';

class GoogleSigninServiceImpl implements GoogleSigninService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final isSignedIn = await GoogleSignIn.instance
          .attemptLightweightAuthentication();
      if (isSignedIn case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(idToken: final idToken?),
      )) {
        return Success(idToken);
      } else {
        return Failure(Exception('User is not signed in'));
      }
    } catch (e) {
      log(
        'Unexpected error during Google Sign-In status check: $e',
        name: 'GoogleSigninServiceImpl.isSignedIn',
        error: e,
        stackTrace: StackTrace.current,
      );
      return Failure(Exception('Unexpected error during sign-in status check'));
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: [
          'email',
          'profile',
          'openid',
        ],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      }

      return Failure(Exception('Failed to sign in'));
    } catch (e) {
      log(
        'Unexpected error during Google Sign-In: $e',
        name: 'GoogleSigninServiceImpl.signIn',
        error: e,
        stackTrace: StackTrace.current,
      );
      return Failure(Exception('Unexpected error during sign-in'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e) {
      log(
        'Unexpected error during Google Sign-Out: $e',
        name: 'GoogleSigninServiceImpl.signOut',
        error: e,
        stackTrace: StackTrace.current,
      );
      return Failure(Exception('Unexpected error during sign-out'));
    }
  }
}
