class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String avatar;
  final String id;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      avatar: json['avatar'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
