import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? usrId;
  final String email;
  final String password;
  final String? imgStr;
  Users({this.usrId, required this.email, required this.password, this.imgStr});

  factory Users.fromMap(Map<String, dynamic> json) => Users(
      usrId: json["usrId"],
      email: json["email"],
      password: json["usrPassword"],
      imgStr: json["imgStr"]);

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "email": email,
        "usrPassword": password,
        "imgStr": imgStr
      };
}
