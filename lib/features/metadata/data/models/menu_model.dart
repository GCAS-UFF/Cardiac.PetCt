import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/data/models/food_model.dart';
import 'package:petct/features/metadata/data/models/meal_item_model.dart';
import 'package:petct/features/metadata/data/models/meal_model.dart';
import 'package:petct/features/metadata/domain/entities/menu.dart';

class MenuModel extends Menu {
  MenuModel({
    @required id,
    @required country,
    @required List<MealModel> meals,
    @required List<MealItemModel> allowedFoods,
    @required List<FoodModel> forbidenFoods,
    @required durationInDays,
  }) : super(
          id: id,
          country: country,
          meals: meals,
          allowedFoods: allowedFoods,
          forbidenFoods: forbidenFoods,
          durationInDays: durationInDays,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (country != null) json['country'] = country;
    if (meals != null) json['meals'] = MealModel.listToJson(json['meals']);
    if (allowedFoods != null)
      json['allowedFoods'] = MealItemModel.listToJson(json['allowedFoods']);
    if (forbidenFoods != null)
      json['forbidenFoods'] = FoodModel.listToJson(json['forbidenFoods']);
    if (durationInDays != null) json['durationInDays'] = durationInDays;
    return json;
  }

  factory MenuModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MenuModel(
      id: json['id'],
      country: json['country'],
      meals: MealModel.listToJson(json['meals']),
      allowedFoods: MealItemModel.listToJson(json['allowedFoods']),
      forbidenFoods: FoodModel.listToJson(json['forbidenFoods']),
      durationInDays: json['durationInDays'],
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
      durationInDays: menu.durationInDays,
    );
  }

  factory MenuModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> menuMap = dataSnapshot.value;
    menuMap['id'] = dataSnapshot.key;

    return MenuModel.fromJson(menuMap);
  }
}
