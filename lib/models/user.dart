import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.uuid,
    this.name,
    this.email,
    this.phone,
    this.designation,
    this.gst,
  });

  int? id;
  String? uuid;
  String? name;
  String? email;
  String? phone;
  String? designation;
  dynamic gst;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        designation: json["designation"],
        gst: json["GST"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "email": email,
        "phone": phone,
        "designation": designation,
        "GST": gst,
      };
}
