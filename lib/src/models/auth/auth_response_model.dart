import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imba/src/models/user/user_model.dart';

part 'auth_response_model.freezed.dart';

part 'auth_response_model.g.dart';

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({required String token, required UserModel user}) =
      _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
