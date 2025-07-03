import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListingsByAgencies extends ConsumerWidget {
  const ListingsByAgencies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Center(child: Text('Listings by Agencies')));
  }
}
