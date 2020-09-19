import 'package:flutter/material.dart';
import 'package:petct/features/about-food/presentation/widgets/food_group_card.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';

class AllowedFoodGroups extends StatelessWidget {
  final List<MealItemModel> allFoods;
  AllowedFoodGroups({Key key, this.allFoods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoodGroup> foodGroups = [
      FoodGroup.PROTEIN,
      FoodGroup.OILS,
      FoodGroup.CHEESE,
      FoodGroup.VEGETABLES,
      FoodGroup.LIQUID,
    ];
    List<MealItemModel> foodByGroup = List<MealItemModel>();

    return SingleChildScrollView(
      child: Container(
        child: Column(
            children: foodGroups.map((data) {
          foodByGroup = List<MealItemModel>();
          allFoods.map((item) {
            if (item.group == data) {
              foodByGroup.add(item);
            }
          }).toList();
          return FoodGroupCard(data: foodByGroup, foodGroup: data);
        }).toList()),
      ),
    );
  }
}
