import 'package:equatable/equatable.dart';

enum UserRole { tenant, landlord, agent }

class User extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final String? phoneNumber;
  final String? profileImage;
  final UserRole role;
  final DateTime createdAt;
  final bool isVerified;
  final List<String> favoriteProperties;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    this.phoneNumber,
    this.profileImage,
    required this.role,
    required this.createdAt,
    required this.isVerified,
    required this.favoriteProperties,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
      role: UserRole.values.firstWhere(
        (role) => role.toString() == 'UserRole.${json['role']}',
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isVerified: json['isVerified'] as bool,
      favoriteProperties: List<String>.from(json['favoriteProperties'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'role': role.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'isVerified': isVerified,
      'favoriteProperties': favoriteProperties,
    };
  }

  @override
  List<Object?> get props => [
        id,
        email,
        fullName,
        phoneNumber,
        profileImage,
        role,
        createdAt,
        isVerified,
        favoriteProperties,
      ];

  User copyWith({
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
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
      favoriteProperties: favoriteProperties ?? this.favoriteProperties,
    );
  }
}
