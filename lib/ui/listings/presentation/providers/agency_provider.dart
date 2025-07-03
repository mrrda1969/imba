import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:imba/ui/profiles/data/models/agency.dart';
import 'package:imba/ui/profiles/data/repos/agents.dart';
import 'package:collection/collection.dart';

part 'agency_provider.g.dart';

/// List of all agencies (static data for now)
@riverpod
List<Agency> agencies(Ref ref) {
  return staticAgencies;
}

/// Currently selected agency
@riverpod
class SelectedAgency extends _$SelectedAgency {
  @override
  String? build() => null;

  void set(String? agencyId) => state = agencyId;
}

/// Currently selected suburb
@riverpod
class SelectedSuburb extends _$SelectedSuburb {
  @override
  String? build() => null;

  void set(String? suburb) => state = suburb;
}

@riverpod
String? agencyNameById(Ref ref, String agencyId) {
  final agencies = ref.watch(agenciesProvider);
  final match = agencies.firstWhereOrNull((a) => a.agencyId == agencyId);
  return match?.agencyName;
}
