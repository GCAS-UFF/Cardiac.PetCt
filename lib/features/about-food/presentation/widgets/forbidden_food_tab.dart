import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/about-food/presentation/widgets/food_card.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';

class ForbiddenFoodContent extends StatelessWidget {
  final List<MealItemModel> forbiddenFood;

  const ForbiddenFoodContent({Key key, this.forbiddenFood}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: Dimensions.getEdgeInsets(context, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    FeatherIcons.alertTriangle,
                    size: Dimensions.getConvertedWidthSize(context, 27),
                    color: ColorsApp.dangerRed,
                  ),
                  SizedBox(
                    width: Dimensions.getConvertedWidthSize(context, 20),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Atenção!",
                          style: TextStyle(
                            color: ColorsApp.dangerRed,
                            fontSize: Dimensions.getTextSize(context, 18),
                          ),
                        ),
                        Text(
                          "Durante o período de dieta, a ingestão de qualquer um dos alimentos abaixo impede a realização do exame",
                          style: TextStyle(
                            fontSize: Dimensions.getTextSize(context, 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 25),
              ),
              Wrap(
                  spacing: Dimensions.getConvertedWidthSize(context, 20),
                  runSpacing: Dimensions.getConvertedHeightSize(context, 20),
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: forbiddenFood.map((data) {
                    return FoodCard(data: data);
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
