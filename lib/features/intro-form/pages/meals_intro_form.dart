import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/base_page.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/date_picker_app.dart';
import 'package:petct/core/ui/time_picker_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';

class MealsIntroForm extends StatefulWidget {
  @override
  _MealsIntroFormState createState() => _MealsIntroFormState();
}

class _MealsIntroFormState extends State<MealsIntroForm> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _breakfast;
  String _morningSnack;
  String _lunch;
  String _afternoonSnack;
  String _dinner;
  String _supper;
  bool _breakfastControl;
  bool _morningSnackControl;
  bool _lunchControl;
  bool _afternoonSnackControl;
  bool _dinnerControl;
  bool _supperControl;
  Widget _buildBody(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, top: 35),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                Strings(context).selectMealsTime,
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
                      Strings(context).mealsTimeTitle,
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
                    label: Strings(context).breakfastLabel,
                    value: _breakfast,
                    onChange: (TimeOfDay time) {
                      setState(() {
                        _formData[Keys.LABEL_BREAKFAST] = time;
                        _breakfast = time.format(context);
                      });
                    },
                  ),
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
                      title: Strings(context).readyLabel,
                      onPressed: () {
                        if (_enableNext() == true) {
                          Route route = AnimationSlideTransistion(
                            widget: BasePage(),
                          );
                          Navigator.push(context, route);
                        }
                      },
                      type: ButtonType.BUTTON_GREEN,
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
    if (_formData[Keys.LABEL_BREAKFAST] == null) {
      setState(() {
        _breakfastControl = false;
        return false;
      });
    }
    if (_formData[Keys.LABEL_MORNINGSNACK] == null) {
      setState(() {
        _morningSnackControl = false;
        return false;
      });
    }
    if (_formData[Keys.LABEL_LUNCH] == null) {
      setState(() {
        _lunchControl = false;
        return false;
      });
    }
    if (_formData[Keys.LABEL_AFTERNOONSNACK] == null) {
      setState(() {
        _afternoonSnackControl = false;
        return false;
      });
    }
    if (_formData[Keys.LABEL_DINNER] == null) {
      setState(() {
        _dinnerControl = false;
        return false;
      });
    }
    if (_formData[Keys.LABEL_SUPPER] == null) {
      setState(() {
        _supperControl = false;
        return false;
      });
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
