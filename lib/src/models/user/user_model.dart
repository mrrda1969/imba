import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

enum UserRole { admin, agent, user }

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String firstname,
    required String lastname,
    required String email,
    String? phone,
    @Default(UserRole.user) UserRole role,
    String? password,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
