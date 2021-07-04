import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';

class MealItemWidget extends StatefulWidget {
  final UserMealItem mealItem;

  const MealItemWidget({Key key, this.mealItem}) : super(key: key);
  @override
  _UserMealItemState createState() => _UserMealItemState();
}

class _UserMealItemState extends State<MealItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, top: 15, bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Dimensions.getConvertedWidthSize(context, 1),
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Meal item name
          Text(
            widget.mealItem.name,
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
          //Meal item quantity
          Text(
            widget.mealItem.portion.toString(),
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
        ],
      ),
    );
  }
}
