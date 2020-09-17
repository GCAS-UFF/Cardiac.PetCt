import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';
import 'package:meta/meta.dart';

class MealModel {
  String id;
  String name;
  String mealTime;
  List<MealItemModel> mealItens;
  MEALSTATUS status;
  MEALSNAME mealsName;

  static const Map<MEALSNAME, String> _enumToString = {
    MEALSNAME.Breakfast: "Café da manhã",
    MEALSNAME.MorningSnack: "Lanche da Manhã",
    MEALSNAME.Lunch: "Almoço",
    MEALSNAME.AfternoonSnack: "Lanche da tarde",
    MEALSNAME.Dinner: "Jantar",
    MEALSNAME.Supper: "Ceia",
  };

  MealModel(
      {this.id,
      @required this.mealTime,
      @required this.mealItens,
      @required this.status,
      @required this.mealsName})
      : name = _enumToString[mealsName];
}

enum MEALSTATUS { Recorded, Pending, Waiting }

enum MEALSNAME {
  Breakfast,
  MorningSnack,
  Lunch,
  AfternoonSnack,
  Dinner,
  Supper
}
