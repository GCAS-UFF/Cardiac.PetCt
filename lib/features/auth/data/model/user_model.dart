import 'package:firebase_database/firebase_database.dart';
import 'package:petct/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  UserModel(
      {@required id,
      @required name,
      @required birthDate,
      @required gender,
      @required email})
      : super(
            id: id,
            name: name,
            birthDate: birthDate,
            gender: gender,
            email: email);

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (name != null) json['name'] = name;
    if (birthDate != null) json['birthDate'] = birthDate.millisecondsSinceEpoch;
    if (gender != null) json['gender'] = gender;
    if (email != null) json['email'] = email;

    return json;
  }

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return UserModel(
        id: json['id'],
        name: json['name'],
        birthDate: (json['birthDate'] != null)
            ? DateTime.fromMillisecondsSinceEpoch(json['birthDate'])
            : null,
        gender: json['gender'],
        email: json['email']);
  }

  factory UserModel.fromEntity(User user) {
    if (user == null) return null;
    return UserModel(
      id: user.id,
      name: user.name,
      birthDate: user.birthDate,
      gender: user.gender,
      email: user.email,
    );
  }

  factory UserModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> userMap = dataSnapshot.value;
    userMap['id'] = dataSnapshot.key;

    return UserModel.fromJson(userMap);
  }
}
