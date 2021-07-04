import 'package:petct/features/diet-meals/presentation/models/food.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';

class Menu {
  List<UserMeal> meals;
  List<Food> forbidden;
  List<UserMealItem> allowedFoods;
  Menu({
    this.meals,
  });
}
