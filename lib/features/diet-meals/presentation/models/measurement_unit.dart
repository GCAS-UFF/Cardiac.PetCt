import 'package:meta/meta.dart';

import 'meal_type.dart';

class MeasurementUnit {
  String name;
  MealType type;

  MeasurementUnit({@required this.name, @required this.type});
}

enum MeasurementUnitType { MILLIMETER, UNITY, GRAMS }
