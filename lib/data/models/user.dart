import 'package:equatable/equatable.dart';

enum UserRole { tenant, landlord, agent }

class User extends Equatable {
  final String id;
  final String email;
  final String? password;
  final String fullName;
  final String? phoneNumber;
  final String? profileImage;
  final UserRole role;
  final bool isVerified;
  final List<String> favoriteProperties;

  const User({
    required this.id,
    required this.email,
    this.password,
    required this.fullName,
    this.phoneNumber,
    this.profileImage,
    required this.role,
    required this.isVerified,
    required this.favoriteProperties,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
      role: UserRole.values.firstWhere(
        (role) => role.toString() == 'UserRole.${json['role']}',
      ),
      isVerified: json['isVerified'] as bool,
      favoriteProperties: List<String>.from(json['favoriteProperties'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'role': role.toString().split('.').last,
      'isVerified': isVerified,
      'favoriteProperties': favoriteProperties,
    };
  }

  @override
  List<Object?> get props => [
    id,
    email,
    fullName,
    password,
    phoneNumber,
    profileImage,
    role,
    isVerified,
    favoriteProperties,
  ];

  User copyWith({
    String? id,
    String? email,
    String? password,
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
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      role: role ?? this.role,
      isVerified: isVerified ?? this.isVerified,
      favoriteProperties: favoriteProperties ?? this.favoriteProperties,
    );
  }
}
