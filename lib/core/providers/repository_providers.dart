import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/data/repositories/property_repository.dart';

final propertyRepositoryProvider = Provider<PropertyRepository>((ref) {
  return PropertyRepository();
});
