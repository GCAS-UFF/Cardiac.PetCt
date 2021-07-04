import 'package:flutter/material.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';

class Day {
  int dayNumber;
  List<UserMeal> dailyMeals;
  DateTime date;
  Day({
    @required this.dayNumber,
    @required this.dailyMeals,
    @required this.date,
  });
}
