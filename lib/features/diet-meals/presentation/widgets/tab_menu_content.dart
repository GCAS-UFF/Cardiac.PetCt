import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/diet-meals/presentation/models/day.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_card.dart';

class TabMenuContent extends StatefulWidget {
  final Day day;
  final List<UserMeal> allMeals;

  const TabMenuContent({Key key, this.day, this.allMeals}) : super(key: key);
  @override
  _TabMenuContentState createState() => _TabMenuContentState();
}

class _TabMenuContentState extends State<TabMenuContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: Dimensions.getEdgeInsets(context, top: 20),
        alignment: Alignment.bottomCenter,
        child: Column(
          //Build meals of the day
          children: widget.day.dailyMeals.map((data) {
            return MealCard(
              meal: data,
              allMeals: widget.allMeals,
            );
          }).toList(),
        ),
      ),
    );
  }
}
