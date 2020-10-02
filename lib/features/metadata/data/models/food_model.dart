import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/food.dart';

class FoodModel extends Food {
  FoodModel(
      {@required id,
      @required name,
      @required classification,
      @required imageUrl})
      : super(
          id: id,
          name: name,
          classification: classification,
          imageUrl: imageUrl,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (name != null) json['name'] = name;
    if (classification != null) json['classification'] = classification;
    if (imageUrl != null) json['imageUrl'] = imageUrl;

    return json;
  }

  factory FoodModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return FoodModel(
      id: json['id'],
      name: json['name'],
      classification: json['classification'],
      imageUrl: json['imageUrl'],
    );
  }

  factory FoodModel.fromEntity(Food food) {
    if (food == null) return null;
    return FoodModel(
      id: food.id,
      name: food.name,
      classification: food.classification,
      imageUrl: food.imageUrl,
    );
  }

  factory FoodModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> foodMap = dataSnapshot.value;
    foodMap['id'] = dataSnapshot.key;

    return FoodModel.fromJson(foodMap);
  }
}
