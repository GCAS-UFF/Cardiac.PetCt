import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/about-food/presentation/pages/allowed_group_food_page.dart';
import 'package:petct/features/diet-meals/presentation/models/classification.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';
import 'package:provider/provider.dart';

class ClassificationTypeCard extends StatelessWidget {
  final List<UserMealItem> data;
  final ClassificationType foodGroup;

  const ClassificationTypeCard({Key key, this.data, this.foodGroup})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    String groupName;
    String exampleFood;
    String imageGroup;
    switch (foodGroup) {
      case ClassificationType.PROTEIN:
        groupName = Strings(context).protein;
        imageGroup = Images.protein_group;
        exampleFood = Strings(context).proteinExamples;
        break;
      case ClassificationType.OILS:
        groupName = Strings(context).oils;
        imageGroup = Images.oil_group;
        exampleFood = Strings(context).oilsExamples;
        break;
      case ClassificationType.CHEESE:
        groupName = Strings(context).cheese;
        imageGroup = Images.cheese_group;
        exampleFood = Strings(context).cheeseExamples;
        break;
      case ClassificationType.VEGETABLES:
        groupName = Strings(context).vegetables;
        imageGroup = Images.leaf_group;
        exampleFood = Strings(context).vegetablesExamples;
        break;
      case ClassificationType.LIQUID:
        groupName = Strings(context).liquid;
        imageGroup = Images.liquid_group;
        exampleFood = Strings(context).liquidExamples;
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
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 12),
                                  color: _themeChanger.getThemeData() == false
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: groupName,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 14),
                                  color: _themeChanger.getThemeData() == false
                                      ? Colors.black
                                      : Colors.white,
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
                          style: GoogleFonts.montserrat(
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
