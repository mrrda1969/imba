import 'package:equatable/equatable.dart';

enum UserRole { user, agent, landlord }

extension UserRoleExtension on UserRole {
  static UserRole fromString(String role) {
    switch (role) {
      case 'bnb_clients':
        return UserRole.user;
      case 'bnb_agents':
        return UserRole.agent;
      case 'bnb_property_owners':
        return UserRole.landlord;
      default:
        throw ArgumentError('Invalid role: $role');
    }
  }

  String toApiString() {
    switch (this) {
      case UserRole.user:
        return 'bnb_clients';
      case UserRole.agent:
        return 'bnb_agents';
      case UserRole.landlord:
        return 'bnb_property_owners';
    }
  }
}

class User extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final UserRole role;
  final String? password;
  final String? verificationCode;

  const User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
    this.password,
    this.verificationCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
      role: UserRoleExtension.fromString(json['role'] as String),
      password: json['password'] as String?,
      verificationCode: json['verification_code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'role': role.toApiString(),
      if (password != null) 'password': password,
      if (verificationCode != null) 'verification_code': verificationCode,
    };
    
    return data;
  }

  @override
  List<Object?> get props => [email, firstName, lastName, phoneNumber, role, password, verificationCode];
}
