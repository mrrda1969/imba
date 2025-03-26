import 'package:equatable/equatable.dart';

enum UserRole { user, agent, landlord }

extension UserRoleExtension on UserRole {
  static UserRole fromString(String role) {
    switch (role) {
      case 'user':
        return UserRole.user;
      case 'agent':
        return UserRole.agent;
      case 'landlord':
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
        return 'bnb_clients';
      case UserRole.landlord:
        return 'bnb_property_owners';
    }
  }
}

class User extends Equatable {
  final String? id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final UserRole role;
  final String? password;
  final String? verificationCode;

  const User({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
    this.password,
    this.verificationCode,
  });

  /// Create a User instance for login response
  factory User.fromLoginResponse(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;
    if (data == null) {
      throw FormatException('Invalid response format: missing data field');
    }

    final email = data['email']?.toString();
    final phoneNumber = data['phone_number']?.toString();

    if (email == null || phoneNumber == null) {
      throw FormatException('Invalid credentials');
    }

    // For login response, we'll use email as first/last name until profile is loaded
    final nameParts = email.split('@');
    final name = nameParts[0];

    return User(
      email: email,
      phoneNumber: phoneNumber,
      firstName: name,
      lastName: '',
      role: UserRole.user, // Default role, can be updated later
    );
  }

  /// Create a User instance for signup
  factory User.forSignup({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required UserRole role,
    required String password,
    required String verificationCode,
  }) {
    return User(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      role: role,
      password: password,
      verificationCode: verificationCode,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'role': role.toApiString(),
      if (id != null) 'id': id,
      if (password != null) 'password': password,
      if (verificationCode != null) 'verification_code': verificationCode,
    };
    
    return data;
  }

  @override
  List<Object?> get props => [id, email, firstName, lastName, phoneNumber, role, password, verificationCode];
}
