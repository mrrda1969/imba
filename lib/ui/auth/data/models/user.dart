import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String firstName,
    required String lastName,
    required String email,
    String? phoneNumber,
    String? role,
    String? password,
    String? verificationCode,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  // User to JSON
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this as _User);

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, role: $role, password: $password, verificationCode: $verificationCode)';
  }
}
