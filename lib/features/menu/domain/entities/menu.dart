import 'package:equatable/equatable.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_item.dart';
import 'package:petct/features/menu/domain/entities/foood.dart';
import 'package:petct/features/menu/domain/entities/meal.dart';
import 'package:meta/meta.dart';

class Menu extends Equatable {
  final String country;
  final List<Meal> meals;
  final List<MealItem> allowedFoods;
  final List<Food> forbiden;
  final int durationInDays;

  Menu({
    @required this.country,
    @required this.meals,
    @required this.allowedFoods,
    @required this.forbiden,
    @required this.durationInDays,
  });

  @override
  List<Object> get props =>
      [country, meals, allowedFoods, forbiden, durationInDays];
}
