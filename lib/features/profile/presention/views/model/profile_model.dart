class ProfileModel {
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  
  ProfileModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstname: json['name']['firstname'],
      lastname: json['name']['lastname'],
      email: json['email'],
      password: json['password'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "name": {
        "firstname": firstname,
        "lastname": lastname,
      },
     
    };
  }
}
