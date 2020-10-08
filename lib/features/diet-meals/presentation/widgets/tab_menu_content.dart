import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_card.dart';

class TabMenuContent extends StatefulWidget {
  final List<MealModel> meals;

  const TabMenuContent({Key key, this.meals}) : super(key: key);
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
          children: widget.meals.map((data) {
            return MealCard(data: data);
          }).toList(),
        ),
      ),
    );
  }
}
