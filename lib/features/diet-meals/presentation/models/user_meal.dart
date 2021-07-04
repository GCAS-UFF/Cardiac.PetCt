import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_type.dart';

class UserMeal {
  String comment;
  List<UserMealItem> mealItems;
  MealStatus status;
  DateTime executedTime;
  MealType type;

  UserMeal(
      {this.comment,
      this.mealItems,
      this.status,
      this.executedTime,
      this.type});
}

enum MealStatus { Recorded, Pending, Waiting }
