import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/about-food/presentation/pages/allowed_group_food_page.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';

class FoodGroupCard extends StatelessWidget {
  final List<MealItemModel> data;
  final FoodGroup foodGroup;

  const FoodGroupCard({Key key, this.data, this.foodGroup}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String groupName;
    String exampleFood;
    String imageGroup;
    switch (foodGroup) {
      case FoodGroup.PROTEIN:
        groupName = "Proteínas";
        imageGroup = Images.protein_group;
        exampleFood = "Carne, frango, ovos, etc";
        break;
      case FoodGroup.OILS:
        groupName = "Gorduras e oleaginosas";
        imageGroup = Images.oil_group;
        exampleFood = "Azeite, castanhas, etc";
        break;
      case FoodGroup.CHEESE:
        groupName = "Queijos";
        imageGroup = Images.cheese_group;
        exampleFood = "Gorgonzola, brie, etc";
        break;
      case FoodGroup.VEGETABLES:
        groupName = "Vegetais";
        imageGroup = Images.leaf_group;
        exampleFood = "Alface, couve, etc";
        break;
      case FoodGroup.LIQUID:
        groupName = "Líquidos";
        imageGroup = Images.liquid_group;
        exampleFood = "Água, café, etc";
        break;
      default:
        "";
    }
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllowedGroupFoodPage(
                    data: data, foodGroup: groupName, groupImage: imageGroup),
              ),
            );
          },
          child: Container(
            padding: Dimensions.getEdgeInsetsFromLTRB(context, 10, 20, 30, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.getConvertedWidthSize(context, 10),
              ),
              border: Border.all(
                width: Dimensions.getConvertedWidthSize(context, 2),
                color: Colors.grey[300],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      imageGroup,
                      width: Dimensions.getConvertedWidthSize(context, 50),
                      height: Dimensions.getConvertedHeightSize(context, 50),
                    ),
                    SizedBox(
                      width: Dimensions.getConvertedWidthSize(context, 20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: Strings(context).groupTitle,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                              TextSpan(
                                text: groupName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.getTextSize(context, 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.getConvertedHeightSize(context, 5),
                        ),
                        Text(
                          exampleFood,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Dimensions.getTextSize(context, 16),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  FeatherIcons.chevronRight,
                  size: Dimensions.getConvertedWidthSize(context, 30),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.getConvertedHeightSize(context, 15),
        ),
      ],
    );
  }
}
