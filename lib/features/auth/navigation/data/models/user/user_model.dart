import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/entities/user/user_entity.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  factory UserModel({
    required String id,
    required String email,
    required String displayName,
    required String photoUrl,
    @Default(false) bool isEmailVerified,
  }) = _UserModel;

  factory UserModel.fromFirebase({required User user}) => UserModel(
    id: user.uid,
    email: user.email ?? '',
    displayName: user.displayName ?? '',
    photoUrl: user.photoURL ?? '',
    isEmailVerified: user.emailVerified,
  );

  UserEntity toEntity() => UserEntity(
    id: id,
    email: email,
    displayName: displayName,
    photoUrl: photoUrl,
    isEmailVerified: isEmailVerified,
  );
}
