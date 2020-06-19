import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';

class MealItem extends StatefulWidget {
  final MealItemModel mealItem;

  const MealItem({Key key, this.mealItem}) : super(key: key);
  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
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
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 12),
            ),
          ),
          //Meal item quantity
          Text(
            widget.mealItem.quantity,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 12),
            ),
          ),
        ],
      ),
    );
  }
}
