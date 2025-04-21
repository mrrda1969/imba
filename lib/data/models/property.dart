import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final String id;
  final String title;
  final String description;
  final String? location;
  final double? price;
  final List<String> images;
  final int? bedrooms;
  final int? bathrooms;
  final double? area;
  final String? type;
  final List<String> amenities;
  final double? latitude;
  final double? longitude;
  final bool isFavorite;
  final String? ownerId;
  final String? agentId;
  final bool isComplete;

  const Property({
    required this.id,
    required this.title,
    required this.description,
    this.location,
    this.price,
    required this.images,
    this.bedrooms,
    this.bathrooms,
    this.area,
    this.type,
    required this.amenities,
    this.latitude,
    this.longitude,
    this.isFavorite = false,
    this.ownerId,
    this.agentId,
    this.isComplete = false,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String?,
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      images: json['images'] as List<String>,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: json['bathrooms'] as int?,
      area: json['area'] != null ? (json['area'] as num).toDouble() : null,
      type: json['type'] as String?,
      amenities: json['amenities'] as List<String>,
      latitude:
          json['latitude'] != null
              ? (json['latitude'] as num).toDouble()
              : null,
      longitude:
          json['longitude'] != null
              ? (json['longitude'] as num).toDouble()
              : null,
      isFavorite: json['isFavorite'] as bool,
      ownerId: json['ownerId'] as String?,
      agentId: json['agentId'] as String?,
      isComplete: json['isComplete'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'images': images,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'type': type,
      'amenities': amenities,
      'latitude': latitude,
      'longitude': longitude,
      'isFavorite': isFavorite,
      'ownerId': ownerId,
      'agentId': agentId,
      'isComplete': isComplete,
    };
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    location,
    price,
    images,
    bedrooms,
    bathrooms,
    area,
    type,
    amenities,
    latitude,
    longitude,
    isFavorite,
    ownerId,
    agentId,
    isComplete,
  ];

  Property copyWith({
    String? id,
    String? title,
    String? description,
    String? location,
    double? price,
    List<String>? images,
    int? bedrooms,
    int? bathrooms,
    double? area,
    String? type,
    List<String>? amenities,
    double? latitude,
    double? longitude,
    bool? isFavorite,
    String? ownerId,
    String? agentId,
    bool? isComplete,
  }) {
    return Property(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      price: price ?? this.price,
      images: images ?? this.images,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      area: area ?? this.area,
      type: type ?? this.type,
      amenities: amenities ?? this.amenities,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isFavorite: isFavorite ?? this.isFavorite,
      ownerId: ownerId ?? this.ownerId,
      agentId: agentId ?? this.agentId,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  // Dummy data generator
  static List<Property> getDummyProperties() {
    return [
      Property(
        id: '1',
        title: 'Modern Apartment in Christon Bank',
        description: 'A modern apartment in a serene environment',
        location: 'Chrison Bank',
        price: 1500,
        images: [
          'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
          'https://images.unsplash.com/photo-1628745277874-919d8f8ed03a',
        ],
        bedrooms: 2,
        bathrooms: 2,
        area: 800,
        type: 'Apartment',
        amenities: ['Wi-Fi', 'Gym', 'Pool'],
        latitude: -17.613939,
        longitude: 31.005392,
        isFavorite: false,
        ownerId: '3',
        agentId: '2',
        isComplete: true,
      ),
      Property(
        id: '2',
        title: 'Family House with Garden',
        description: 'A cozy family house with a beautiful garden',
        location: 'Tynwald, Harare',
        price: 2200,
        images: [
          'https://images.unsplash.com/photo-1580587771525-78b9dba3b914',
          'https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf',
        ],
        bedrooms: 3,
        bathrooms: 2,
        area: 1200,
        type: 'House',
        amenities: ['Wi-Fi', 'Garden', 'Parking'],
        latitude: -17.810128,
        longitude: 30.950258,
        isFavorite: false,
        ownerId: '1',
        agentId: '4',
        isComplete: true,
      ),
      Property(
        id: '3',
        title: 'Luxury Penthouse Suite',
        description: 'A luxurious penthouse suite with stunning views',
        location: 'Avondale, Harare',
        price: 3500,
        images: [
          'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd',
          'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd',
        ],
        bedrooms: 2,
        bathrooms: 2,
        area: 1500,
        type: 'Penthouse',
        amenities: ['Wi-Fi', 'Gym', 'Pool'],
        latitude: -17.795612,
        longitude: 31.035934,
        isFavorite: false,
        ownerId: '2',
        agentId: '3',
        isComplete: true,
      ),
      Property(
        id: '4',
        title: 'Studio Apartment near University',
        description: 'A cozy studio apartment near the university',
        location: 'University of Zimbabwe',
        price: 800,
        images: [
          'https://images.unsplash.com/photo-1554995207-c18c203602cb',
          'https://images.unsplash.com/photo-1501183638710-841dd1904471',
        ],
        bedrooms: 1,
        bathrooms: 1,
        area: 500,
        type: 'Studio',
        amenities: ['Wi-Fi', 'Kitchen'],
        latitude: -17.786964,
        longitude: 31.048424,
        isFavorite: false,
        ownerId: '2',
        agentId: '3',
        isComplete: true,
      ),
    ];
  }
}
