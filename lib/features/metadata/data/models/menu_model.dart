import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/menu.dart';

class MenuModel extends Menu {
  MenuModel({
    @required id,
    @required country,
    @required meals,
    @required allowedFoods,
    @required forbidenFoods,
  }) : super(
          id: id,
          country: country,
          meals: meals,
          allowedFoods: allowedFoods,
          forbidenFoods: forbidenFoods,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (country != null) json['country'] = country;
    if (meals != null) json['meals'] = meals;
    if (allowedFoods != null) json['allowedFoods'] = allowedFoods;
    if (forbidenFoods != null) json['forbidenFoods'] = forbidenFoods;

    return json;
  }

  factory MenuModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MenuModel(
      id: json['id'],
      country: json['country'],
      meals: json['meals'],
      allowedFoods: json['allowedFoods'],
      forbidenFoods: json['forbidenFoods'],
    );
  }

  factory MenuModel.fromEntity(Menu menu) {
    if (menu == null) return null;
    return MenuModel(
      id: menu.id,
      country: menu.country,
      meals: menu.meals,
      allowedFoods: menu.allowedFoods,
      forbidenFoods: menu.forbidenFoods,
    );
  }

  factory MenuModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> menuMap = dataSnapshot.value;
    menuMap['id'] = dataSnapshot.key;

    return MenuModel.fromJson(menuMap);
  }
}
