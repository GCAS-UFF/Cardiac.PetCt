import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/date_picker_app.dart';
import 'package:petct/core/ui/time_picker_app.dart';

class MealsIntroForm extends StatefulWidget {
  @override
  _MealsIntroFormState createState() => _MealsIntroFormState();
}

class _MealsIntroFormState extends State<MealsIntroForm> {
  String _breakfast;
  String _morningSnack;
  String _lunch;
  String _afternoonSnack;
  String _dinner;
  String _supper;
  Widget _buildBody(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, top: 35),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: Dimensions.getEdgeInsets(context, left: 25),
                    child: Icon(
                      FeatherIcons.arrowLeft,
                      size: Dimensions.getConvertedWidthSize(context, 35),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 60),
            ),
            Text(
              "Selecione os horários de suas refeições",
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
                    "Horário das refeições",
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
                TimePickerApp(
                  label: "Café da Manhã",
                  value: _breakfast,
                  onChange: (TimeOfDay time) {
                    setState(() {
                      _breakfast = time.format(context);
                    });
                  },
                ),
                TimePickerApp(
                  label: "Lanche da Manhã",
                  value: _morningSnack,
                  onChange: (TimeOfDay time) {
                    setState(() {
                      _morningSnack = time.format(context);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TimePickerApp(
                  label: "Almoço",
                  value: _lunch,
                  onChange: (TimeOfDay time) {
                    setState(() {
                      _lunch = time.format(context);
                    });
                  },
                ),
                TimePickerApp(
                  label: "Lanche da Tarde",
                  value: _afternoonSnack,
                  onChange: (TimeOfDay time) {
                    setState(() {
                      _afternoonSnack = time.format(context);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TimePickerApp(
                  label: "Jantar",
                  value: _dinner,
                  onChange: (TimeOfDay time) {
                    setState(() {
                      _dinner = time.format(context);
                    });
                  },
                ),
                TimePickerApp(
                  label: "Ceia",
                  value: _supper,
                  onChange: (TimeOfDay time) {
                    setState(() {
                      _supper = time.format(context);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: Dimensions.getEdgeInsets(context, right: 25),
                  width: Dimensions.getConvertedWidthSize(context, 200),
                  child: ButtonApp(
                    title: "Pronto",
                    onPressed: () {},
                    type: ButtonType.BUTTON_GREEN,
                  ),
                ),
              ],
            ),
          ],
        ),
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
