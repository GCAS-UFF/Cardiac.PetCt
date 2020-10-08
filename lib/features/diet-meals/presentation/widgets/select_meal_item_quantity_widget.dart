import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/number_counter_widget.dart';

class SelectMealItemQuantityWidget extends StatefulWidget {
  final MealItemModel mealItem;

  const SelectMealItemQuantityWidget({Key key, this.mealItem})
      : super(key: key);
  @override
  _SelectMealItemQuantityWidgetState createState() =>
      _SelectMealItemQuantityWidgetState();
}

class _SelectMealItemQuantityWidgetState
    extends State<SelectMealItemQuantityWidget> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, bottom: 10, top: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Checkbox(
                value: _value,
                onChanged: (bool value) {
                  setState(() {
                    _value = !_value;
                  });
                },
                activeColor: ColorsApp.greenApp,
              ),
              Text(
                widget.mealItem.name,
                style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 16),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          NumberCounterWidget(
            enabled: _value,
          ),
        ],
      ),
    );
  }
}
