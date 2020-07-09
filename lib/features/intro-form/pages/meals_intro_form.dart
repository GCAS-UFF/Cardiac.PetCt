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
import 'package:petct/features/intro-form/widgets/meal_times_form.dart';

class MealsIntroForm extends StatefulWidget {
  @override
  _MealsIntroFormState createState() => _MealsIntroFormState();
}

class _MealsIntroFormState extends State<MealsIntroForm> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  // Back button
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
              // Select meals title
              Text(
                Strings(context).selectMealsTime,
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 17),
                ),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 60),
              ),
              MealTimesForm(
                onChange: (TimeOfDay time, String meal) {
                  if (meal == "breakFast") {
                    _formData[Keys.LABEL_BREAKFAST] = time;
                  }
                  if (meal == "morningSnack") {
                    _formData[Keys.LABEL_MORNINGSNACK] = time;
                  }
                  if (meal == "lunch") {
                    _formData[Keys.LABEL_LUNCH] = time;
                  }
                  if (meal == "afternoonSnack") {
                    _formData[Keys.LABEL_AFTERNOONSNACK] = time;
                  }
                  if (meal == "dinner") {
                    _formData[Keys.LABEL_DINNER] = time;
                  }
                  if (meal == "supper") {
                    _formData[Keys.LABEL_SUPPER] = time;
                  }
                },
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Next button
                  Container(
                    margin: Dimensions.getEdgeInsets(context, right: 25),
                    width: Dimensions.getConvertedWidthSize(context, 200),
                    child: ButtonApp(
                      title: Strings(context).readyLabel,
                      onPressed: () {
                        // Enable next button
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

  //Validate empty fields
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
