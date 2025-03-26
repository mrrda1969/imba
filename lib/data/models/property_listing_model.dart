import 'package:equatable/equatable.dart';

enum UserRole { agent, landlord, user }

class PropertyListing extends Equatable {
  final String id;
  final String listingName;
  final String location;
  final String price;
  final String agent;
  final String propertyOwner;
  final String service;
  final String description;
  

  const PropertyListing({
    required this.id,
    required this.listingName,
    required this.location,
    required this.price,
    required this.agent,
    required this.propertyOwner,
    required this.service,
    required this.description,
    
  });

  factory PropertyListing.fromJson(Map<String, dynamic> json) {
    return PropertyListing(
      id: json['id'] as String,
      listingName: json['listingName'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      agent: json['agent'] as String,
      propertyOwner: json['propertyOwner'] as String,
      service: json['service'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listingName': listingName,
      'location': location,
      'price': price,
      'agent': agent,
      'propertyOwner': propertyOwner,
      'service': service,
      'description': description,
      
    };
  }

  @override
  List<Object?> get props => [
        listingName,
        location,
        price,
        agent,
        propertyOwner,
        service,
        description,
        
      ];

  PropertyListing copyWith({
    String? id,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? profileImage,
    UserRole? role,
    DateTime? createdAt,
    bool? isVerified,
    List<String>? favoriteProperties,
  }) {
    return PropertyListing(
      id: id ?? this.id,
      listingName: listingName ?? listingName,
      location: location ?? location,
      price: price ?? price,
      agent: agent ?? agent,
      propertyOwner: propertyOwner ?? propertyOwner,
      service: service ?? service,
      description: description ?? description,
      
    );
  }
}
