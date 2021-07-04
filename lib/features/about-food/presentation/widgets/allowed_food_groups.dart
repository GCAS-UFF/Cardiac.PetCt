import 'package:flutter/material.dart';
import 'package:petct/features/about-food/presentation/widgets/food_group_card.dart';
import 'package:petct/features/diet-meals/presentation/models/classification.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';

class AllowedClassificationTypes extends StatelessWidget {
  final List<UserMealItem> allFoods;
  AllowedClassificationTypes({Key key, this.allFoods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ClassificationType> foodGroups = [
      ClassificationType.PROTEIN,
      ClassificationType.OILS,
      ClassificationType.CHEESE,
      ClassificationType.VEGETABLES,
      ClassificationType.LIQUID,
    ];
    List<UserMealItem> foodByGroup = List<UserMealItem>();

    return SingleChildScrollView(
      child: Container(
        child: Column(
            children: foodGroups.map((data) {
          foodByGroup = List<UserMealItem>();
          // allFoods.map((item) {
          //   if (item.group == data) {
          //     foodByGroup.add(item);
          //   }
          // }).toList();
          return ClassificationTypeCard(data: foodByGroup, foodGroup: data);
        }).toList()),
      ),
    );
  }
}
