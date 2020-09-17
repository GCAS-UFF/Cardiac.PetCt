import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/features/intro-form/models/exam_details.dart';
import 'package:petct/features/intro-form/models/meal_times.dart';
import 'package:petct/features/intro-form/widgets/exam_details_form.dart';
import 'package:petct/features/intro-form/widgets/meal_times_form.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> _list;
  MealTimes _mealTimes = MealTimes(
    breakfast: TimeOfDay(hour: 23, minute: 45),
    morningSnack: TimeOfDay(hour: 22, minute: 45),
    lunch: TimeOfDay(hour: 21, minute: 45),
    afternoonSnack: TimeOfDay(hour: 20, minute: 45),
    dinner: TimeOfDay(hour: 19, minute: 45),
    supper: TimeOfDay(hour: 18, minute: 45),
  );
  ExamDetails examDetails = ExamDetails(
    examDate: DateTime(2020),
    examTime: TimeOfDay(hour: 25, minute: 15),
    examLocation: "hospital1",
  );
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sareh Saúde e Retaguarda Hospitalar",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 16),
              ),
            )
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
                padding: Dimensions.getEdgeInsets(context,
                    right: 30, left: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Settings title
                    Text(
                      "Configurações",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 20),
                      ),
                    ),
                    // Menu icon
                    Icon(
                      FeatherIcons.menu,
                      size: Dimensions.getConvertedWidthSize(context, 30),
                    ),
                  ],
                ),
              ),
              //Exam form
              ExamDetailsForm(
                examDetails: examDetails,
                onChange: (value) {
                  setState(() {
                    value.runtimeType == DateTime
                        ? _formData[Keys.LABEL_DATE] = value
                        : value.runtimeType == TimeOfDay
                            ? _formData[Keys.LABEL_TIME] = value
                            : _formData[Keys.LABEL_LOCAL] = value;
                  });
                },
                list: _list,
              ),
              MealTimesForm(
                mealTimes: _mealTimes,
                onChange: (TimeOfDay time, MealEnum meal) {
                  if (meal == MealEnum.Breakfast) {
                    _formData[Keys.LABEL_BREAKFAST] = time;
                  }
                  if (meal == MealEnum.MorningSnack) {
                    _formData[Keys.LABEL_MORNINGSNACK] = time;
                  }
                  if (meal == MealEnum.Lunch) {
                    _formData[Keys.LABEL_LUNCH] = time;
                  }
                  if (meal == MealEnum.AfternoonSnack) {
                    _formData[Keys.LABEL_AFTERNOONSNACK] = time;
                  }
                  if (meal == MealEnum.Dinner) {
                    _formData[Keys.LABEL_DINNER] = time;
                  }
                  if (meal == MealEnum.Supper) {
                    _formData[Keys.LABEL_SUPPER] = time;
                  }
                },
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
