import 'dart:async';
import 'package:flutter/material.dart';

class PropertySearchDelegate extends SearchDelegate<String> {
  final List<String> allProperties; // Your data source
  Timer? _debounceTimer;
  
  PropertySearchDelegate({List<String>? properties})
      : allProperties = properties ?? [
          'Ocean View Villa',
          'Mountain Retreat',
          'Downtown Apartment',
          'Lakeside Cottage',
          'Beachfront Condo',
          'Countryside House',
          'Urban Loft',
          'Garden Bungalow'
        ];

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // This will be called after selection or when search is pressed
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Cancel any previous timer when a new search is initiated
    _debounceTimer?.cancel();
    
    if (query.isEmpty) return Container();
    
    // Set up a new timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // This callback will be called after 500ms of no typing
      showSuggestions(context);
    });

    return _buildSearchResults(query, isSuggestions: true);
  }

  Widget _buildSearchResults(String query, {bool isSuggestions = false}) {
    final results = allProperties
        .where((property) => property.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return _buildNoResults();
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final property = results[index];
        return ListTile(
          title: isSuggestions 
              ? _buildHighlightedSuggestion(property)
              : Text(property),
          leading: const Icon(Icons.home),
          onTap: () => close(context, property),
        );
      },
    );
  }

  Widget _buildHighlightedSuggestion(String suggestion) {
    final queryLower = query.toLowerCase();
    final suggestionLower = suggestion.toLowerCase();
    
    final matchIndex = suggestionLower.indexOf(queryLower);
    
    if (matchIndex < 0) return Text(suggestion);
    
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(text: suggestion.substring(0, matchIndex)),
          TextSpan(
            text: suggestion.substring(matchIndex, matchIndex + query.length),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          TextSpan(text: suggestion.substring(matchIndex + query.length)),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'No results for "$query"',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
