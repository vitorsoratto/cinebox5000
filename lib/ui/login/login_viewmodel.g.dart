// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(loginViewmodel)
const loginViewmodelProvider = LoginViewmodelProvider._();

final class LoginViewmodelProvider
    extends $FunctionalProvider<LoginViewmodel, LoginViewmodel, LoginViewmodel>
    with $Provider<LoginViewmodel> {
  const LoginViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginViewmodelHash();

  @$internal
  @override
  $ProviderElement<LoginViewmodel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginViewmodel create(Ref ref) {
    return loginViewmodel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginViewmodel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginViewmodel>(value),
    );
  }
}

String _$loginViewmodelHash() => r'00259e2233dc51b4919dda768ec397062d95ae2c';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
