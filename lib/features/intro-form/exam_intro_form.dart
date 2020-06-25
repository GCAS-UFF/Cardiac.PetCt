import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/features/intro-form/meals_intro_form.dart';

class ExamIntroForm extends StatefulWidget {
  @override
  _ExamIntroFormState createState() => _ExamIntroFormState();
}

class _ExamIntroFormState extends State<ExamIntroForm> {
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
          InkWell(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
              );
            },
            child: Container(
              margin: Dimensions.getEdgeInsets(context, top: 25, bottom: 25),
              height: Dimensions.getConvertedHeightSize(context, 60),
              color: Colors.blue,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[],
              ),
            ),
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
          InkWell(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
              );
            },
            child: Container(
              margin: Dimensions.getEdgeInsets(context, top: 25, bottom: 25),
              height: Dimensions.getConvertedHeightSize(context, 60),
              color: Colors.blue,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
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
