import 'package:meta/meta.dart';

class MealType {
  String name;
  MealTypeEnum type;

  MealType({@required this.name, @required this.type});
}

enum MealTypeEnum {
  BREAKFAST,
  MORNINGSNACK,
  LUNCH,
  AFTERNOONSNACK,
  DINNER,
  SUPPER
}
