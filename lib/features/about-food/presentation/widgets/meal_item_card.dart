import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/diet-meals/presentation/models/classification.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';
import 'package:provider/provider.dart';

class UserMealItemCard extends StatelessWidget {
  final UserMealItem mealItem;

  const UserMealItemCard({Key key, this.mealItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Stack(
      children: [
        Container(
          padding: Dimensions.getEdgeInsets(context, top: 5, bottom: 5),
          width: Dimensions.getConvertedWidthSize(context, 150),
          height:
              // data.group == ClassificationType.FORBIDDEN
              //     ?
              Dimensions.getConvertedHeightSize(context, 150),
          // : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.getConvertedWidthSize(context, 10),
            ),
            border: Border.all(
              width: Dimensions.getConvertedWidthSize(context, 2),
              color: Colors.grey[300],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                mealItem.imagePath,
                width: Dimensions.getConvertedWidthSize(context, 70),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 15),
              ),
              Text(
                mealItem.name,
                style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 18),
                ),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 10),
              ),
              mealItem.foods[0].classificationType !=
                      ClassificationType.FORBIDDEN
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: Strings(context).maximumQuantity,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        Dimensions.getTextSize(context, 14),
                                    color: _themeChanger.getThemeData() == false
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: mealItem.portion.toString(),
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        Dimensions.getTextSize(context, 14),
                                    color: _themeChanger.getThemeData() == false
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Icon(
            mealItem.foods[0].classificationType == ClassificationType.FORBIDDEN
                ? FeatherIcons.slash
                : FeatherIcons.check,
            color: mealItem.foods[0].classificationType ==
                    ClassificationType.FORBIDDEN
                ? ColorsApp.dangerRed
                : Colors.green,
            size: Dimensions.getConvertedWidthSize(context, 25),
          ),
        ),
      ],
    );
  }
}
