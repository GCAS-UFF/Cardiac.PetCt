import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_dropdown.dart';
import 'package:petct/core/ui/date_picker_app.dart';
import 'package:petct/core/ui/time_picker_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/core/utils/date_helper.dart';

import 'meals_intro_form.dart';

class ExamIntroForm extends StatefulWidget {
  @override
  _ExamIntroFormState createState() => _ExamIntroFormState();
}

class _ExamIntroFormState extends State<ExamIntroForm> {
  DateTime _dateTime;
  String _timeDay;
  Widget _buildBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sobre o exame",
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 22),
            ),
          ),
          SizedBox(
            height: Dimensions.getConvertedHeightSize(context, 20),
          ),
          Text(
            "Digite os dados do seu exame",
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 17),
            ),
          ),
          SizedBox(
            height: Dimensions.getConvertedHeightSize(context, 60),
          ),
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
                Text(
                  "Data e hora do exame",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 23),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DatePickerApp(
                value: _dateTime,
                onChange: (DateTime date) {
                  setState(() {
                    _dateTime = date;
                  });
                },
              ),
              TimePickerApp(
                label: "Hora",
                value: _timeDay,
                onChange: (TimeOfDay time) {
                  setState(() {
                    _timeDay = time.format(context);
                  });
                },
              )
            ],
          ),
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
                Text(
                  "Local do exame",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 23),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: Dimensions.getEdgeInsetsFromLTRB(context, 25, 20, 25, 20),
            child: CustomDropdown(hint: Text("Local")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: Dimensions.getEdgeInsets(context, right: 25),
                width: Dimensions.getConvertedWidthSize(context, 200),
                child: ButtonApp(
                  title: "Próximo",
                  onPressed: () {
                    Route route = AnimationSlideTransistion(
                      widget: MealsIntroForm(),
                    );
                    Navigator.push(context, route);
                  },
                  type: ButtonType.BUTTON_GREEN,
                  suffixIcon: FeatherIcons.arrowRight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
