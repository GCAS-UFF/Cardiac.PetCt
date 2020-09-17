import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/features/intro-form/pages/meals_intro_screen.dart';
import 'package:petct/features/intro-form/widgets/exam_details_form.dart';


class ExamIntroScreen extends StatefulWidget {
  @override
  _ExamIntroScreenState createState() => _ExamIntroScreenState();
}

class _ExamIntroScreenState extends State<ExamIntroScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sareh Saúde e Retaguarda Hospitalar",
              textAlign: TextAlign.center ,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 16),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Title
            Text(
              Strings(context).aboutExam,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 22),
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 20),
            ),
            // Fill exam details title
            Text(
              Strings(context).fillExamDetails,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 17),
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 60),
            ),
            //Exam form
            ExamDetailsForm(
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
            //Next button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: Dimensions.getEdgeInsets(context, right: 25, top: 30),
                  width: Dimensions.getConvertedWidthSize(context, 200),
                  child: ButtonApp(
                    title: Strings(context).nextOption,
                    onPressed: () {
                      //Enable next button
                      if (_enableNext() == true) {
                        Route route = AnimationSlideTransistion(
                          widget: MealsIntroScreen(),
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
    );
  }

  //Validate empty fields
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
