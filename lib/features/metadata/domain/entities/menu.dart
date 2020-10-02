import 'package:equatable/equatable.dart';
import 'package:petct/features/metadata/domain/entities/meal.dart';
import 'package:meta/meta.dart';

import 'food.dart';
import 'meal_item.dart';

class Menu extends Equatable {
  final String id;
  final String country;
  final List<Meal> meals;
  final List<MealItem> allowedFoods;
  final List<Food> forbidenFoods;
  final int durationInDays;

  Menu(
      {@required this.id,
      @required this.country,
      @required this.meals,
      @required this.allowedFoods,
      @required this.forbidenFoods,
      @required this.durationInDays});

  @override
  List<Object> get props =>
      [id, country, meals, allowedFoods, forbidenFoods, durationInDays];
}
