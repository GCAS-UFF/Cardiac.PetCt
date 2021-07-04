import 'dart:io';

import 'package:meta/meta.dart';
import 'package:petct/features/diet-meals/presentation/models/food.dart';
import 'package:petct/features/diet-meals/presentation/models/measurement_unit.dart';

class UserMealItem {
  String name;
  List<Food> foods;
  double portion;
  MeasurementUnitType measurementUnitType;
  String imagePath;

  UserMealItem(
      {@required this.name,
      @required this.foods,
      @required this.measurementUnitType,
      this.portion,
      this.imagePath});
}
