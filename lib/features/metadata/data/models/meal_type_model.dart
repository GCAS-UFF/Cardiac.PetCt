import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/classification.dart';
import 'package:petct/features/metadata/domain/entities/meal_type.dart';

class MealTypeModel extends Classification {
  MealTypeModel({@required id, @required name, @required type})
      : super(
          id: id,
          name: name,
          type: type,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (name != null) json['name'] = name;
    if (type != null) json['type'] = type;

    return json;
  }

  factory MealTypeModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MealTypeModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
    );
  }

  factory MealTypeModel.fromEntity(MealType mealType) {
    if (mealType == null) return null;
    return MealTypeModel(
      id: mealType.id,
      name: mealType.name,
      type: mealType.type,
    );
  }

  factory MealTypeModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> mealTypeMap = dataSnapshot.value;
    mealTypeMap['id'] = dataSnapshot.key;

    return MealTypeModel.fromJson(mealTypeMap);
  }
}
