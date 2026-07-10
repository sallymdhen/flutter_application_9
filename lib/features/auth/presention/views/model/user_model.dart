class UserModel {
  final String accessToken;
  final String email;
  final String firstName;
  final String lastName;
  final String image;

  UserModel({
    required this.accessToken,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['accessToken'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
    };
  }
}
