import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? usrId;
  final String email;
  final String? usrName;
  final String? password;
  final String? phone;
  final String? adress;
  final String? gender;
  final String? imgStr;
  Users(
      {this.usrId,
      required this.email,
      this.usrName,
      this.password,
      this.phone,
      this.adress,
      this.gender,
      this.imgStr});

  factory Users.fromMap(Map<String, dynamic> json) => Users(
      usrId: json["usrId"],
      email: json["email"],
      usrName: json["usrName"],
      password: json["usrPassword"],
      imgStr: json["imgStr"],
      phone: json["phone"],
      adress: json["adress"],
      gender: json["gender"]);

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "email": email,
        "usrName": usrName,
        "usrPassword": password,
        "imgStr": imgStr,
        "phone": phone,
        "adress": adress,
        "gender": gender,
      };
}
