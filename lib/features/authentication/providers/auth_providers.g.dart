// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authServiceHash() => r'e771c719cfb4bd87b7f15fc6722ef9f56a9844e4';

/// Provider for AuthService - Singleton instance
///
/// Copied from [authService].
@ProviderFor(authService)
final authServiceProvider = AutoDisposeProvider<AuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthServiceRef = AutoDisposeProviderRef<AuthService>;
String _$isAuthenticatedHash() => r'd1361aa2596942529d9f4cfb68d8d9dd2a99454a';

/// Provider to check if user is authenticated based on login state
///
/// Copied from [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeProvider<bool>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAuthenticatedRef = AutoDisposeProviderRef<bool>;
String _$hasPermissionHash() => r'f65e2597f35fe70926b3e19968763392998f638f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Family provider for checking user permissions
///
/// Copied from [hasPermission].
@ProviderFor(hasPermission)
const hasPermissionProvider = HasPermissionFamily();

/// Family provider for checking user permissions
///
/// Copied from [hasPermission].
class HasPermissionFamily extends Family<bool> {
  /// Family provider for checking user permissions
  ///
  /// Copied from [hasPermission].
  const HasPermissionFamily();

  /// Family provider for checking user permissions
  ///
  /// Copied from [hasPermission].
  HasPermissionProvider call({
    required UserModel? user,
    required String permission,
  }) {
    return HasPermissionProvider(user: user, permission: permission);
  }

  @override
  HasPermissionProvider getProviderOverride(
    covariant HasPermissionProvider provider,
  ) {
    return call(user: provider.user, permission: provider.permission);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'hasPermissionProvider';
}

/// Family provider for checking user permissions
///
/// Copied from [hasPermission].
class HasPermissionProvider extends AutoDisposeProvider<bool> {
  /// Family provider for checking user permissions
  ///
  /// Copied from [hasPermission].
  HasPermissionProvider({required UserModel? user, required String permission})
    : this._internal(
        (ref) => hasPermission(
          ref as HasPermissionRef,
          user: user,
          permission: permission,
        ),
        from: hasPermissionProvider,
        name: r'hasPermissionProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$hasPermissionHash,
        dependencies: HasPermissionFamily._dependencies,
        allTransitiveDependencies:
            HasPermissionFamily._allTransitiveDependencies,
        user: user,
        permission: permission,
      );

  HasPermissionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
    required this.permission,
  }) : super.internal();

  final UserModel? user;
  final String permission;

  @override
  Override overrideWith(bool Function(HasPermissionRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: HasPermissionProvider._internal(
        (ref) => create(ref as HasPermissionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
        permission: permission,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _HasPermissionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HasPermissionProvider &&
        other.user == user &&
        other.permission == permission;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);
    hash = _SystemHash.combine(hash, permission.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HasPermissionRef on AutoDisposeProviderRef<bool> {
  /// The parameter `user` of this provider.
  UserModel? get user;

  /// The parameter `permission` of this provider.
  String get permission;
}

class _HasPermissionProviderElement extends AutoDisposeProviderElement<bool>
    with HasPermissionRef {
  _HasPermissionProviderElement(super.provider);

  @override
  UserModel? get user => (origin as HasPermissionProvider).user;
  @override
  String get permission => (origin as HasPermissionProvider).permission;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
