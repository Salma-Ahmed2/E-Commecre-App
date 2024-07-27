import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/Feauters/Auth/Entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uID,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uID: user.uid,
    );
  }
}
