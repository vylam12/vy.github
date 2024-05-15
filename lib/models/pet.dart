import 'dart:convert';

Pets usersFromMap(String str) => Pets.fromMap(json.decode(str));

String usersToMap(Pets data) => json.encode(data.toMap());

class Pets {
  int? id;
  String? imgStr;
  String breedName;
  int age;
  String color;
  String name;
  double weight;
  double height;
  String gender;
  int userId;
  Pets({
    this.id,
    required this.age,
    required this.breedName,
    required this.name,
    required this.color,
    required this.height,
    required this.userId,
    required this.gender,
    required this.weight,
    this.imgStr,
  });

  factory Pets.fromMap(Map<String, dynamic> json) => Pets(
        id: json["petId"],
        imgStr: json["imgStr"] as String? ?? "",
        color: json["color"],
        name: json["name"],
        gender: json["gender"].toString(),
        breedName: json["breedName"],
        age: json["age"],
        weight: json["weight"],
        height: json["height"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "petId": id,
        "imgStr": imgStr,
        "color": color,
        "name": name,
        "gender": gender,
        "breedName": breedName,
        "age": age,
        "weight": weight,
        "height": height,
        "userId": userId,
      };
}
