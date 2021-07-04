import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/about-food/presentation/mobx/controller.dart';
import 'package:petct/features/about-food/presentation/widgets/allowed_food_groups.dart';
import 'package:petct/features/about-food/presentation/widgets/forbidden_food_tab.dart';
import 'package:petct/features/diet-meals/presentation/models/classification.dart';
import 'package:petct/features/diet-meals/presentation/models/food.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';
import 'package:petct/features/diet-meals/presentation/models/measurement_unit.dart';

class AboutFoodPage extends StatelessWidget {
  AboutFoodPage({Key key}) : super(key: key);

  List<UserMealItem> forbiddenFood = [];
  List<UserMealItem> allFoods = [
    UserMealItem(
      name: 'Carne vermelha',
      foods: [
        Food(
          name: "Carne vermelha",
          classificationType: ClassificationType.PROTEIN,
          imagePath: Images.bread_forbidden,
        )
      ],
      portion: 100,
      measurementUnitType: MeasurementUnitType.GRAMS,
    ),
    UserMealItem(
      name: 'Carne vermelha',
      foods: [
        Food(
          name: "Carne vermelha",
          classificationType: ClassificationType.PROTEIN,
          imagePath: Images.bread_forbidden,
        )
      ],
      portion: 100,
      measurementUnitType: MeasurementUnitType.GRAMS,
    ),
    UserMealItem(
      name: 'Cuscuz',
      foods: [
        Food(
          name: "Cuscuz",
          classificationType: ClassificationType.FORBIDDEN,
          imagePath: Images.bread_forbidden,
        )
      ],
      portion: 100,
      measurementUnitType: MeasurementUnitType.GRAMS,
    ),
    UserMealItem(
      name: 'Arroz',
      foods: [
        Food(
          name: "Arroz",
          classificationType: ClassificationType.FORBIDDEN,
          imagePath: Images.bread_forbidden,
        )
      ],
      portion: 100,
      measurementUnitType: MeasurementUnitType.GRAMS,
    ),
  ];

  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    allFoods.map((data) {
      data.foods.map((item) {
        if (item.classificationType == ClassificationType.FORBIDDEN)
          forbiddenFood.add(data);
      });
    }).toList();
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 20, 40, 20, 0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Strings(context).aboutFood,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: Dimensions.getConvertedWidthSize(context, 24),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    controller.changeTab();
                  },
                  child: Observer(builder: (_) {
                    return Container(
                      padding: Dimensions.getEdgeInsetsFromLTRB(
                          context, 20, 8, 20, 8),
                      decoration: BoxDecoration(
                        color: controller.index.value == true
                            ? ColorsApp.successGreen
                            : null,
                        borderRadius: BorderRadius.circular(
                          Dimensions.getConvertedWidthSize(context, 50),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FeatherIcons.check,
                            color: controller.index.value == true
                                ? Colors.white
                                : null,
                            size: Dimensions.getConvertedWidthSize(context, 20),
                          ),
                          SizedBox(
                            width: Dimensions.getConvertedWidthSize(context, 5),
                          ),
                          Text(
                            Strings(context).dietFood,
                            style: GoogleFonts.montserrat(
                              color: controller.index.value == true
                                  ? Colors.white
                                  : null,
                              fontSize: Dimensions.getTextSize(context, 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                InkWell(
                  onTap: () {
                    controller.changeTab();
                  },
                  child: Observer(
                    builder: (_) {
                      return Container(
                        padding: Dimensions.getEdgeInsetsFromLTRB(
                            context, 20, 8, 20, 8),
                        decoration: BoxDecoration(
                          color: controller.index.value == false
                              ? ColorsApp.dangerRed
                              : null,
                          borderRadius: BorderRadius.circular(
                            Dimensions.getConvertedWidthSize(context, 50),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              FeatherIcons.slash,
                              color: controller.index.value == false
                                  ? Colors.white
                                  : null,
                              size:
                                  Dimensions.getConvertedWidthSize(context, 20),
                            ),
                            SizedBox(
                              width:
                                  Dimensions.getConvertedWidthSize(context, 5),
                            ),
                            Text(
                              Strings(context).forbiddenFoodTitle,
                              style: GoogleFonts.montserrat(
                                color: controller.index.value == false
                                    ? Colors.white
                                    : null,
                                fontSize: Dimensions.getTextSize(context, 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 20),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return controller.index.value == true
                      ? AllowedClassificationTypes(
                          allFoods: allFoods,
                        )
                      : ForbiddenFoodContent(
                          forbiddenFood: forbiddenFood,
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
