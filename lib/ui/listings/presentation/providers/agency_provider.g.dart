// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$agenciesHash() => r'f01147a2da6bf4e129fecf03be8146a6f07d00a3';

/// List of all agencies (static data for now)
///
/// Copied from [agencies].
@ProviderFor(agencies)
final agenciesProvider = AutoDisposeProvider<List<Agency>>.internal(
  agencies,
  name: r'agenciesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$agenciesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AgenciesRef = AutoDisposeProviderRef<List<Agency>>;
String _$agencyNameByIdHash() => r'6de219dfe09d4c19374d2b5f9294aa237da687d7';

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

/// See also [agencyNameById].
@ProviderFor(agencyNameById)
const agencyNameByIdProvider = AgencyNameByIdFamily();

/// See also [agencyNameById].
class AgencyNameByIdFamily extends Family<String?> {
  /// See also [agencyNameById].
  const AgencyNameByIdFamily();

  /// See also [agencyNameById].
  AgencyNameByIdProvider call(String agencyId) {
    return AgencyNameByIdProvider(agencyId);
  }

  @override
  AgencyNameByIdProvider getProviderOverride(
    covariant AgencyNameByIdProvider provider,
  ) {
    return call(provider.agencyId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'agencyNameByIdProvider';
}

/// See also [agencyNameById].
class AgencyNameByIdProvider extends AutoDisposeProvider<String?> {
  /// See also [agencyNameById].
  AgencyNameByIdProvider(String agencyId)
    : this._internal(
        (ref) => agencyNameById(ref as AgencyNameByIdRef, agencyId),
        from: agencyNameByIdProvider,
        name: r'agencyNameByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$agencyNameByIdHash,
        dependencies: AgencyNameByIdFamily._dependencies,
        allTransitiveDependencies:
            AgencyNameByIdFamily._allTransitiveDependencies,
        agencyId: agencyId,
      );

  AgencyNameByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agencyId,
  }) : super.internal();

  final String agencyId;

  @override
  Override overrideWith(String? Function(AgencyNameByIdRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: AgencyNameByIdProvider._internal(
        (ref) => create(ref as AgencyNameByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agencyId: agencyId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String?> createElement() {
    return _AgencyNameByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AgencyNameByIdProvider && other.agencyId == agencyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agencyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AgencyNameByIdRef on AutoDisposeProviderRef<String?> {
  /// The parameter `agencyId` of this provider.
  String get agencyId;
}

class _AgencyNameByIdProviderElement extends AutoDisposeProviderElement<String?>
    with AgencyNameByIdRef {
  _AgencyNameByIdProviderElement(super.provider);

  @override
  String get agencyId => (origin as AgencyNameByIdProvider).agencyId;
}

String _$selectedAgencyHash() => r'1643c55f40ca4816fcd3208f8ce47be707697bd2';

/// Currently selected agency
///
/// Copied from [SelectedAgency].
@ProviderFor(SelectedAgency)
final selectedAgencyProvider =
    AutoDisposeNotifierProvider<SelectedAgency, String?>.internal(
      SelectedAgency.new,
      name: r'selectedAgencyProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedAgencyHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedAgency = AutoDisposeNotifier<String?>;
String _$selectedSuburbHash() => r'7d44278c049f5a99dec8173e14daf3482fd0d978';

/// Currently selected suburb
///
/// Copied from [SelectedSuburb].
@ProviderFor(SelectedSuburb)
final selectedSuburbProvider =
    AutoDisposeNotifierProvider<SelectedSuburb, String?>.internal(
      SelectedSuburb.new,
      name: r'selectedSuburbProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedSuburbHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedSuburb = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
