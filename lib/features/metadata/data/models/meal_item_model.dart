import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/data/models/food_model.dart';
import 'package:petct/features/metadata/data/models/measurement_group_model.dart';
import 'package:petct/features/metadata/domain/entities/meal_item.dart';

class MealItemModel extends MealItem {
  MealItemModel({
    @required id,
    @required name,
    @required List<FoodModel> foods,
    @required List<MeasurementGroupModel> measurements,
    @required imageUrl,
  }) : super(
          id: id,
          name: name,
          foods: foods,
          measurements: measurements,
          imageUrl: imageUrl,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (name != null) json['name'] = name;
    if (foods != null) json['foods'] = FoodModel.listToJson(json['foods']);
    if (measurements != null)
      json['measurements'] =
          MeasurementGroupModel.listToJson(json['measurements']);
    if (imageUrl != null) json['imageUrl'] = imageUrl;

    return json;
  }

  factory MealItemModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MealItemModel(
      id: json['id'],
      name: json['name'],
      foods: FoodModel.listFromJson(json['foods']),
      measurements: MeasurementGroupModel.listFromJson(json['measurements']),
      imageUrl: json['imageUrl'],
    );
  }

  factory MealItemModel.fromEntity(MealItem mealItem) {
    if (mealItem == null) return null;
    return MealItemModel(
      id: mealItem.id,
      name: mealItem.name,
      foods: mealItem.foods,
      measurements: mealItem.measurements,
      imageUrl: mealItem.imageUrl,
    );
  }

  factory MealItemModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> mealMap = dataSnapshot.value;
    mealMap['id'] = dataSnapshot.key;

    return MealItemModel.fromJson(mealMap);
  }

  static List<dynamic> listToJson(List<MealItemModel> list) {
    return list == null
        ? List<dynamic>()
        : list.map((item) => item.toJson()).toList();
  }

  static List<MealItemModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<MealItemModel>()
        : json.map((item) => MealItemModel.fromJson(item)).toList();
  }
}
