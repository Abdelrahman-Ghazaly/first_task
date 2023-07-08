import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.imageUrl,
    required super.accessToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      imageUrl: map['image'] ?? '',
      accessToken: map['token'] ?? '',
    );
  }
}
