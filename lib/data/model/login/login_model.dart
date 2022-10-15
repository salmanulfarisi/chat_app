class LoginModel {
  LoginModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
