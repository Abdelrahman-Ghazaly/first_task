class UserEntity {
  UserEntity({
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.imageUrl,
    required this.accessToken,
  });

  final String userName;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String imageUrl;
  final String accessToken;
}
