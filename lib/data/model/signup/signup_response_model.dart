class SignupResponseModel {
  SignupResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.pic,
    required this.token,
  });

  final String id;
  final String name;
  final String email;
  final String pic;
  final String token;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "pic": pic,
        "token": token,
      };
}
