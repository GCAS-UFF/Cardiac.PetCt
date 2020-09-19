import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  final MealItemModel data;

  const FoodCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Stack(
      children: [
        Container(
          padding: Dimensions.getEdgeInsets(context, top: 5, bottom: 5),
          width: Dimensions.getConvertedWidthSize(context, 150),
          height: data.group == FoodGroup.FORBIDDEN
              ? Dimensions.getConvertedHeightSize(context, 150)
              : null,
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
                data.image,
                width: Dimensions.getConvertedWidthSize(context, 70),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 15),
              ),
              Text(
                data.name,
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 18),
                ),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 10),
              ),
              data.group != FoodGroup.FORBIDDEN
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Quantidade máxima por refeição:  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        Dimensions.getTextSize(context, 14),
                                    color: _themeChanger.getThemeData() == false
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: data.maximumQuantity.toString(),
                                  style: TextStyle(
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
            data.group == FoodGroup.FORBIDDEN
                ? FeatherIcons.slash
                : FeatherIcons.check,
            color: data.group == FoodGroup.FORBIDDEN
                ? ColorsApp.dangerRed
                : Colors.green,
            size: Dimensions.getConvertedWidthSize(context, 25),
          ),
        ),
      ],
    );
  }
}
