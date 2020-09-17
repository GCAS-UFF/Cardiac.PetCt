import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/time_picker_app.dart';
import 'package:petct/features/intro-form/models/meal_times.dart';

class MealTimesForm extends StatefulWidget {
  final Function onChange;
  final MealTimes mealTimes;

  const MealTimesForm({Key key, @required this.onChange, this.mealTimes})
      : super(key: key);
  @override
  _MealTimesFormState createState() => _MealTimesFormState();
}

class _MealTimesFormState extends State<MealTimesForm> {
  String _breakfast;
  String _morningSnack;
  String _lunch;
  String _afternoonSnack;
  String _dinner;
  String _supper;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.mealTimes != null) {
      _breakfast = widget.mealTimes.breakfast.format(context);
      _morningSnack = widget.mealTimes.morningSnack.format(context);
      _lunch = widget.mealTimes.lunch.format(context);
      _afternoonSnack = widget.mealTimes.afternoonSnack.format(context);
      _dinner = widget.mealTimes.dinner.format(context);
      _supper = widget.mealTimes.supper.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: Dimensions.getEdgeInsets(context, bottom: 10, left: 30),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: Dimensions.getConvertedWidthSize(context, 1),
                color: Colors.grey,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              // Meals time title
              Text(
                Strings(context).mealsTimeTitle,
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 20),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Breakfast time field
            TimePickerApp(
              label: Strings(context).breakfastLabel,
              value: _breakfast,
              onChange: (TimeOfDay time) {
                setState(() {
                  _breakfast = time.format(context);
                  widget.onChange(time, MealEnum.Breakfast);
                });
              },
            ),
            // Morning snack time field
            TimePickerApp(
              label: Strings(context).morningsnackLabel,
              value: _morningSnack,
              onChange: (TimeOfDay time) {
                setState(() {
                  _morningSnack = time.format(context);
                  widget.onChange(time, MealEnum.MorningSnack);
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Lunch time field
            TimePickerApp(
              label: Strings(context).lunchLabel,
              value: _lunch,
              onChange: (TimeOfDay time) {
                setState(() {
                  _lunch = time.format(context);
                  widget.onChange(time, MealEnum.Lunch);
                });
              },
            ),
            // Afternoon snack time field
            TimePickerApp(
              label: Strings(context).afternoonsnackLabel,
              value: _afternoonSnack,
              onChange: (TimeOfDay time) {
                setState(() {
                  _afternoonSnack = time.format(context);
                  widget.onChange(time, MealEnum.AfternoonSnack);
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Dinner time field
            TimePickerApp(
              label: Strings(context).dinnerLabel,
              value: _dinner,
              onChange: (TimeOfDay time) {
                setState(() {
                  _dinner = time.format(context);
                  widget.onChange(time, MealEnum.Dinner);
                });
              },
            ),
            // Supper time field
            TimePickerApp(
              label: Strings(context).supperLabel,
              value: _supper,
              onChange: (TimeOfDay time) {
                setState(() {
                  _supper = time.format(context);
                  widget.onChange(time, MealEnum.Supper);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
