class UsersModel {
  UsersModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.pic,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  String? pic;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        pic: json["pic"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  // Map<String, dynamic> toJson() => {
  //     "_id": id,
  //     "name": name,
  //     "email": email,
  //     "password": password,
  //     "pic": pic,
  //     "createdAt": createdAt.toIso8601String(),
  //     "updatedAt": updatedAt.toIso8601String(),
  //     "__v": v,
  // };
}
