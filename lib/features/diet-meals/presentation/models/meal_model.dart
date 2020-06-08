import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';
import 'package:meta/meta.dart';

class MealModel {
  String name;
  String mealTime;
  MEALSTATUS status;
  List<MealItemModel> mealItens;

  MealModel(
      {@required this.name,
      @required this.mealTime,
      @required this.mealItens,
      @required this.status});
}

enum MEALSTATUS { Recorded, Pending, Waiting }
