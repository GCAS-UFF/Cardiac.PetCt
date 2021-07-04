import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_type.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';
import 'package:petct/features/diet-meals/presentation/widgets/choose_meal_widget.dart';

class ChooseMenuPage extends StatelessWidget {
  final List<UserMeal> mealOptions;
  final MealType mealType;

  const ChooseMenuPage({Key key, this.mealOptions, this.mealType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 30, 30, 30, 0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Strings(context).chooseDish,
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
              height: Dimensions.getConvertedHeightSize(context, 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Meal name
                Text(
                  (mealType.name != null) ? mealType.name : '',
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.getTextSize(context, 20),
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.greenApp,
                  ),
                ),
                Text(
                  " - ",
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.getTextSize(context, 20),
                    color: ColorsApp.greenApp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Meal time
                Text(
                  '12:00',
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.getTextSize(context, 20),
                    color: ColorsApp.greenApp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 5),
            ),
            Text(
              Strings(context).firstDay,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 16),
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 20),
            ),
            ChooseMealWidget(
              mealOptions: mealOptions,
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 20),
            ),
          ],
        ),
      ),
    );
  }
}
