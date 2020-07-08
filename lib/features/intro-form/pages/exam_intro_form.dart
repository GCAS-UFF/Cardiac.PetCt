import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_dropdown.dart';
import 'package:petct/core/ui/date_picker_app.dart';
import 'package:petct/core/ui/time_picker_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';

import 'meals_intro_form.dart';

class ExamIntroForm extends StatefulWidget {
  @override
  _ExamIntroFormState createState() => _ExamIntroFormState();
}

class _ExamIntroFormState extends State<ExamIntroForm> {
  String _timeDay;
  bool _dateControl;
  bool _timeControl;
  bool _localControl;
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> _list;

  Widget _buildBody(BuildContext context) {
    _list = [
      DropdownMenuItem(
        value: 'hospital1',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Sareh Saúde e Retaguarda Hospitalar",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 16),
                color: ColorsApp.greenApp,
              ),
            ),
            Text(
              "R. Edson, 3079 - Vila Prudente, São Paulo",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ],
        ),
      ),
      DropdownMenuItem(
        value: 'hospital2',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Sareh2 Saúde e Retaguarda Hospitalar",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 16),
                color: ColorsApp.greenApp,
              ),
            ),
            Text(
              "R. Edson, 3079 - Vila Prudente, São Paulo",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ],
        ),
      ),
      DropdownMenuItem(
        value: 'hospital3',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Sareh3 Saúde e Retaguarda Hospitalar",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 16),
                color: ColorsApp.greenApp,
              ),
            ),
            Text(
              "R. Edson, 3079 - Vila Prudente, São Paulo",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ],
        ),
      ),
      DropdownMenuItem(
        value: 'hospital4',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Sareh4 Saúde e Retaguarda Hospitalar",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 16),
                color: ColorsApp.greenApp,
              ),
            ),
            Text(
              "R. Edson, 3079 - Vila Prudente, São Paulo",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ],
        ),
      ),
    ];
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Strings(context).aboutExam,
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 22),
                ),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              Text(
                Strings(context).fillExamDetails,
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 17),
                ),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 60),
              ),
              Container(
                padding:
                    Dimensions.getEdgeInsets(context, bottom: 10, left: 30),
                margin: Dimensions.getEdgeInsets(context, bottom: 15),
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
                      Strings(context).dateTimeExam,
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
                    value: _formData[Keys.LABEL_DATE],
                    onChange: (DateTime date) {
                      setState(() {
                        _formData[Keys.LABEL_DATE] = date;
                      });
                    },
                  ),
                  TimePickerApp(
                    label: Strings(context).hourLabel,
                    value: _timeDay,
                    onChange: (TimeOfDay time) {
                      setState(() {
                        _formData[Keys.LABEL_TIME] = time;
                        _timeDay = time.format(context);
                      });
                    },
                  )
                ],
              ),
              Container(
                padding:
                    Dimensions.getEdgeInsets(context, bottom: 10, left: 30),
                margin: Dimensions.getEdgeInsets(context, top: 30),
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
                      Strings(context).examLocation,
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 23),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    Dimensions.getEdgeInsetsFromLTRB(context, 25, 30, 25, 20),
                child: CustomDropdown(
                  hint: Text(Strings(context).localLabel),
                  value: _formData[Keys.LABEL_LOCAL],
                  options: _list,
                  onChange: (String value) {
                    setState(() {
                      _formData[Keys.LABEL_LOCAL] = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin:
                        Dimensions.getEdgeInsets(context, right: 25, top: 30),
                    width: Dimensions.getConvertedWidthSize(context, 200),
                    child: ButtonApp(
                      title: Strings(context).nextOption,
                      onPressed: () {
                        if (_enableNext() == true) {
                          Route route = AnimationSlideTransistion(
                            widget: MealsIntroForm(),
                          );
                          Navigator.push(context, route);
                        }
                      },
                      type: ButtonType.BUTTON_GREEN,
                      suffixIcon: FeatherIcons.arrowRight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _enableNext() {
    if (_formData[Keys.LABEL_DATE] == null) {
      setState(() {
        _dateControl = false;
        return false;
      });
    }
    if (_formData[Keys.LABEL_TIME] == null) {
      setState(() {
        _timeControl = false;
      });
      return false;
    }
    if (_formData[Keys.LABEL_LOCAL] == null) {
      setState(() {
        _localControl = false;
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
