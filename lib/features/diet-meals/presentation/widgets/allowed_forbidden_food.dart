import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/diet-meals/presentation/widgets/food_list_button.dart';

class AllowedForbiddenFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Food title
        Text(
          Strings(context).foodListTitle,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 12),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Allowed food
            FoodListButton(
              allowed: true,
            ),
            SizedBox(
              width: Dimensions.getConvertedWidthSize(context, 15),
            ),
            // Forbidden food
            FoodListButton(
              allowed: false,
            ),
          ],
        ),
      ],
    );
  }
}
