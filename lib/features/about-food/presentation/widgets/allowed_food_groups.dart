import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/features/about-food/presentation/widgets/food_group_card.dart';

class AllowedFoodGroups extends StatelessWidget {
  List<List<String>> food = [
    ["Proteínas", "Carne, frango, ovos, etc.", Images.protein_group],
    ["Gorduras e oleaginosas", "Azeite, manteiga, etc", Images.oil_group],
    ["Queijo", "Gorgonzola, prato, bire, etc", Images.cheese_group],
    ["Vegetais", "Alface, couve, espinafre, etc", Images.leaf_group],
    ["Líquidos", "Água, café, etc", Images.liquid_group]
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: food.map((data) {
        return FoodGroupCard(data: data);
      }).toList()),
    );
  }
}
