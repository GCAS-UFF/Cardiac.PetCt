import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/custom_dropdown.dart';
import 'package:petct/core/ui/date_picker_app.dart';
import 'package:petct/core/ui/time_picker_app.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> _list;
  String _timeDay;
  String _breakfast;
  String _morningSnack;
  String _lunch;
  String _afternoonSnack;
  String _dinner;
  String _supper;
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
    ];
    return Container(
      padding: Dimensions.getEdgeInsets(context, top: 30),
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Menu icon
              Container(
                padding: Dimensions.getEdgeInsets(context, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      FeatherIcons.menu,
                      size: Dimensions.getConvertedWidthSize(context, 30),
                    ),
                  ],
                ),
              ),
              //Settings title
              Container(
                padding:
                    Dimensions.getEdgeInsets(context, left: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 20),
                      ),
                    ),
                  ],
                ),
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
                    // Date title
                    Text(
                      "Data e hora do exame",
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
                  // Date Picker Field
                  DatePickerApp(
                    value: _formData[Keys.LABEL_DATE],
                    onChange: (DateTime date) {
                      setState(() {
                        _formData[Keys.LABEL_DATE] = date;
                      });
                    },
                  ),
                  // Time Picker Field
                  TimePickerApp(
                    label: Strings(context).hourLabel,
                    value: _timeDay,
                    onChange: (TimeOfDay time) {
                      setState(() {
                        _formData[Keys.LABEL_TIME] = time;
                        _timeDay = time.format(context);
                      });
                    },
                  ),
                ],
              ),
              Container(
                padding:
                    Dimensions.getEdgeInsets(context, bottom: 10, left: 30),
                margin: Dimensions.getEdgeInsets(context, top: 10),
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
                    // Exam Location Title
                    Text(
                      Strings(context).examLocation,
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 20),
                      ),
                    ),
                  ],
                ),
              ),
              // Local Dropdown Field
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
              Container(
                padding:
                    Dimensions.getEdgeInsets(context, bottom: 10, left: 30),
                    margin: Dimensions.getEdgeInsets(context,top: 10,bottom: 10),
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
                        _formData[Keys.LABEL_BREAKFAST] = time;
                        _breakfast = time.format(context);
                      });
                    },
                  ),
                  // Morning snack time field
                  TimePickerApp(
                    label: Strings(context).morningsnackLabel,
                    value: _morningSnack,
                    onChange: (TimeOfDay time) {
                      setState(() {
                        _formData[Keys.LABEL_MORNINGSNACK] = time;
                        _morningSnack = time.format(context);
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
                        _formData[Keys.LABEL_LUNCH] = time;
                        _lunch = time.format(context);
                      });
                    },
                  ),
                  // Afternoon snack time field
                  TimePickerApp(
                    label: Strings(context).afternoonsnackLabel,
                    value: _afternoonSnack,
                    onChange: (TimeOfDay time) {
                      setState(() {
                        _formData[Keys.LABEL_AFTERNOONSNACK] = time;
                        _afternoonSnack = time.format(context);
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
                        _formData[Keys.LABEL_DINNER] = time;
                        _dinner = time.format(context);
                      });
                    },
                  ),
                  // Supper time field
                  TimePickerApp(
                    label: Strings(context).supperLabel,
                    value: _supper,
                    onChange: (TimeOfDay time) {
                      setState(() {
                        _formData[Keys.LABEL_SUPPER] = time;
                        _supper = time.format(context);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
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
