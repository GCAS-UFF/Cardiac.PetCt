import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/ui/button_app.dart';

class MealsIntroForm extends StatefulWidget {
  @override
  _MealsIntroFormState createState() => _MealsIntroFormState();
}

class _MealsIntroFormState extends State<MealsIntroForm> {
  Widget _buildBody(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, top: 35),
      height: double.infinity,
      width: double.infinity,
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
                  title: "Pronto",
                  onPressed: () {},
                  type: ButtonType.BUTTON_GREEN,
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
