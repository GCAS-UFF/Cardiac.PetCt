import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';
import 'package:petct/features/diet-meals/presentation/widgets/register_meal_widget.dart';

class RegisterMenuPage extends StatelessWidget {
  final UserMeal userMeal;

  const RegisterMenuPage({Key key, this.userMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    userMeal.type.name,
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
              RegisterMealWidget(
                userMeal: userMeal,
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
