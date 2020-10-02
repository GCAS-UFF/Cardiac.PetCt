import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/meal_item.dart';

class MealItemModel extends MealItem {
  MealItemModel({
    @required id,
    @required name,
    @required foods,
    @required portion,
    @required measurementUnit,
    @required imageUrl,
  }) : super(
          id: id,
          name: name,
          foods: foods,
          portion: portion,
          measurementUnit: measurementUnit,
          imageUrl: imageUrl,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (name != null) json['name'] = name;
    if (foods != null) json['foods'] = foods;
    if (portion != null) json['portion'] = portion;
    if (measurementUnit != null) json['measurementUnit'] = measurementUnit;
    if (imageUrl != null) json['imageUrl'] = imageUrl;

    return json;
  }

  factory MealItemModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MealItemModel(
      id: json['id'],
      name: json['name'],
      foods: json['foods'],
      portion: json['portion'],
      measurementUnit: json['measurementUnit'],
      imageUrl: json['imageUrl'],
    );
  }

  factory MealItemModel.fromEntity(MealItem mealItem) {
    if (mealItem == null) return null;
    return MealItemModel(
      id: mealItem.id,
      name: mealItem.name,
      foods: mealItem.foods,
      portion: mealItem.portion,
      measurementUnit: mealItem.measurementUnit,
      imageUrl: mealItem.imageUrl,
    );
  }

  factory MealItemModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> mealMap = dataSnapshot.value;
    mealMap['id'] = dataSnapshot.key;

    return MealItemModel.fromJson(mealMap);
  }
}
