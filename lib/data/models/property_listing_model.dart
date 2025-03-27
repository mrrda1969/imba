
import 'package:equatable/equatable.dart';

class PropertyListing extends Equatable {
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

  // Factory method to convert JSON to a Listing object
  factory PropertyListing.fromJson(Map<String, dynamic> json) {
    return PropertyListing(
      name: json['name'],
      listingName: json['listing_name'],
      listingOwner: json['listing_owner'],
      listingAgent: json['listing_agent'],
      location: json['location'],
      price: (json['price'] as num).toDouble(),
      service: json['service'],
      description: json['description'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'listing_name': listingName,
      'location': location,
      'price': price,
      'listing_agent': listingAgent,
      'listing_owner': listingOwner,
      'service': service,
      'description': description,
      
    };
  }

  @override
  List<Object?> get props => [
        name,
        listingName,
        location,
        price,
        listingAgent,
        listingOwner,
        service,
        description,
        
      ];
}
