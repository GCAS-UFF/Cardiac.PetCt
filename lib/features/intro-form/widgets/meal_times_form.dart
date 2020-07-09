import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/time_picker_app.dart';

class MealTimesForm extends StatefulWidget {
  final Function onChange;

  const MealTimesForm({Key key, this.onChange}) : super(key: key);
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
                  widget.onChange(time, "breakfast");
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
                  widget.onChange(time, "morningSnack");
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
                  widget.onChange(time, "lunch");
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
                  widget.onChange(time, "afternoonSnack");
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
                  widget.onChange(time, "dinner");
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
                  widget.onChange(time, "supper");
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
