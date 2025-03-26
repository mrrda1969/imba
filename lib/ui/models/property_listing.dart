/// PropertyListing model class for UI layer
class PropertyListing {
  final String name;
  final String listingName;
  final String listingOwner;
  final String listingAgent;
  final String location;
  final double price;
  final String service;
  final String description;

  PropertyListing({
    required this.name,
    required this.listingName,
    required this.listingOwner,
    required this.listingAgent,
    required this.location,
    required this.price,
    required this.service,
    required this.description,
  });

  /// Create a PropertyListing from a Map (typically from API response)
  factory PropertyListing.fromJson(Map<String, dynamic> json) {
    return PropertyListing(
      name: json['name'] ?? '',
      listingName: json['listing_name'] ?? '',
      listingOwner: json['listing_owner'] ?? '',
      listingAgent: json['listing_agent'] ?? '',
      location: json['location'] ?? '',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : 0.0,
      service: json['service'] ?? '',
      description: json['description'] ?? '',
    );
  }

  /// Convert PropertyListing to a Map (typically for API requests)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'listing_name': listingName,
      'listing_owner': listingOwner,
      'listing_agent': listingAgent,
      'location': location,
      'price': price,
      'service': service,
      'description': description,
    };
  }

  /// Create a copy of this PropertyListing with the given fields replaced with new values
  PropertyListing copyWith({
    String? name,
    String? listingName,
    String? listingOwner,
    String? listingAgent,
    String? location,
    double? price,
    String? service,
    String? description,
  }) {
    return PropertyListing(
      name: name ?? this.name,
      listingName: listingName ?? this.listingName,
      listingOwner: listingOwner ?? this.listingOwner,
      listingAgent: listingAgent ?? this.listingAgent,
      location: location ?? this.location,
      price: price ?? this.price,
      service: service ?? this.service,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PropertyListing &&
        other.name == name &&
        other.listingName == listingName &&
        other.listingOwner == listingOwner &&
        other.listingAgent == listingAgent &&
        other.location == location &&
        other.price == price &&
        other.service == service &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        listingName.hashCode ^
        listingOwner.hashCode ^
        listingAgent.hashCode ^
        location.hashCode ^
        price.hashCode ^
        service.hashCode ^
        description.hashCode;
  }
}
