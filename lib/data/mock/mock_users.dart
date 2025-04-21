import 'package:imba/data/models/user.dart';

final mockUsers = [
  User(
    id: '1',
    email: 'tenant@example.com',
    password: 'password123', // In real app, this should be hashed
    fullName: 'John Tenant',
    phoneNumber: '+1234567890',
    role: UserRole.tenant,
    isVerified: true,
    favoriteProperties: [],
  ),
  User(
    id: '2',
    email: 'landlord@example.com',
    password: 'password123',
    fullName: 'Jane Landlord',
    phoneNumber: '+1987654321',
    role: UserRole.landlord,
    isVerified: true,
    favoriteProperties: [],
  ),
  User(
    id: '3',
    email: 'agent@example.com',
    password: 'password123',
    fullName: 'Bob Agent',
    phoneNumber: '+1122334455',
    role: UserRole.agent,
    isVerified: true,
    favoriteProperties: [],
  ),
];
