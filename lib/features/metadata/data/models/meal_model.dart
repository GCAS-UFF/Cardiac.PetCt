import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/meal.dart';

class MealModel extends Meal {
  MealModel({
    @required id,
    @required type,
    @required items,
    @required totalPrice,
    @required currency,
    @required imageUrl,
  }) : super(
          id: id,
          type: type,
          items: items,
          totalPrice: totalPrice,
          currency: currency,
          imageUrl: imageUrl,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (type != null) json['type'] = type;
    if (items != null) json['items'] = items;
    if (totalPrice != null) json['totalPrice'] = totalPrice;
    if (currency != null) json['currency'] = currency;
    if (imageUrl != null) json['imageUrl'] = imageUrl;

    return json;
  }

  factory MealModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MealModel(
      id: json['id'],
      type: json['type'],
      items: json['items'],
      totalPrice: json['totalPrice'],
      currency: json['currency'],
      imageUrl: json['imageUrl'],
    );
  }

  factory MealModel.fromEntity(Meal meal) {
    if (meal == null) return null;
    return MealModel(
      id: meal.id,
      type: meal.type,
      items: meal.items,
      totalPrice: meal.totalPrice,
      currency: meal.currency,
      imageUrl: meal.imageUrl,
    );
  }

  factory MealModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> mealMap = dataSnapshot.value;
    mealMap['id'] = dataSnapshot.key;

    return MealModel.fromJson(mealMap);
  }
}
