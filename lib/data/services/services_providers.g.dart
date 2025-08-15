// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(localStorageService)
const localStorageServiceProvider = LocalStorageServiceProvider._();

final class LocalStorageServiceProvider
    extends
        $FunctionalProvider<
          LocalStorageService,
          LocalStorageService,
          LocalStorageService
        >
    with $Provider<LocalStorageService> {
  const LocalStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStorageServiceHash();

  @$internal
  @override
  $ProviderElement<LocalStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalStorageService create(Ref ref) {
    return localStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStorageService>(value),
    );
  }
}

String _$localStorageServiceHash() =>
    r'df23510735f46f50f301fa15596eaed12eeb6b65';

@ProviderFor(googleSigninService)
const googleSigninServiceProvider = GoogleSigninServiceProvider._();

final class GoogleSigninServiceProvider
    extends
        $FunctionalProvider<
          GoogleSigninService,
          GoogleSigninService,
          GoogleSigninService
        >
    with $Provider<GoogleSigninService> {
  const GoogleSigninServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSigninServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSigninServiceHash();

  @$internal
  @override
  $ProviderElement<GoogleSigninService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleSigninService create(Ref ref) {
    return googleSigninService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleSigninService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleSigninService>(value),
    );
  }
}

String _$googleSigninServiceHash() =>
    r'0e975b9823897d97a9bfcbc808073e7fe3eaee48';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
