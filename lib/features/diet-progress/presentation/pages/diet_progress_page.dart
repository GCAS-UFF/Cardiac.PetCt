import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/diet-progress/presentation/models/progress_item.dart';
import 'package:petct/features/diet-progress/presentation/widgets/progress_cards_list.dart';
import 'package:provider/provider.dart';

class DietProgressPage extends StatefulWidget {
  final Function dietNavigation;

  const DietProgressPage({Key key, this.dietNavigation}) : super(key: key);
  @override
  _DietProgressPageState createState() => _DietProgressPageState();
}

class _DietProgressPageState extends State<DietProgressPage> {
  DateTime dateNow;
  DateTime examDate;
  var difference;

  @override
  void initState() {
    super.initState();
    dateNow = DateTime.now();
    examDate = DateTime(2020, 12, 23);
    difference = examDate.difference(dateNow).inDays;
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return SingleChildScrollView(
      child: Container(
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 10, 45, 10, 0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Your progress title
            Text(
              Strings(context).progressPageTitle,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 20),
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 15),
            ),
            //Progress charts
            difference > 1
                ? CircularPercentIndicator(
                    radius: Dimensions.getConvertedWidthSize(context, 145.0),
                    lineWidth: 8.0,
                    percent: 0.5,
                    center: Text(
                      difference.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 50),
                      ),
                    ),
                    backgroundColor: Colors.grey[300],
                    progressColor: ColorsApp.greenApp,
                  )
                : Container(
                    height: Dimensions.getConvertedHeightSize(context, 140),
                    width: Dimensions.getConvertedWidthSize(context, 140),
                    decoration: BoxDecoration(
                      color: ColorsApp.greenApp,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FeatherIcons.activity,
                      color: Colors.white,
                      size: Dimensions.getConvertedWidthSize(context, 55),
                    ),
                  ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 15),
            ),
            //Current step text
            difference > 3
                ? RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          color: _themeChanger.getThemeData()
                              ? Colors.white
                              : Colors.black),
                      children: [
                        //Black text
                        TextSpan(
                          text: Strings(context).progressPageDaysLeft,
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 22),
                          ),
                        ),
                        //Green text
                        TextSpan(
                          text: Strings(context).progressPageStart,
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 22),
                            color: ColorsApp.greenApp,
                          ),
                        ),
                        //Black text
                        TextSpan(
                          text: Strings(context).progressPageDiet,
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 22),
                          ),
                        ),
                      ],
                    ),
                  )
                : (difference <= 3 && difference > 1)
                    ? RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                              color: _themeChanger.getThemeData()
                                  ? Colors.white
                                  : Colors.black),
                          children: [
                            //Black text
                            TextSpan(
                              text: Strings(context).progressPageDaysLeft,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 22),
                              ),
                            ),
                            //Green text
                            TextSpan(
                              text: Strings(context).progressPageFinish,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 22),
                                color: ColorsApp.greenApp,
                              ),
                            ),
                            //Black text
                            TextSpan(
                              text: Strings(context).progressPageDiet,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 22),
                              ),
                            ),
                          ],
                        ),
                      )
                    : (difference < 1)
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                  color: _themeChanger.getThemeData()
                                      ? Colors.white
                                      : Colors.black),
                              children: [
                                //Black text
                                TextSpan(
                                  text: Strings(context).progressPageHoursLeft,
                                  style: GoogleFonts.montserrat(
                                    fontSize:
                                        Dimensions.getTextSize(context, 22),
                                  ),
                                ),
                                //Green text
                                TextSpan(
                                  text: Strings(context).progressPageFasting,
                                  style: GoogleFonts.montserrat(
                                    fontSize:
                                        Dimensions.getTextSize(context, 22),
                                    color: ColorsApp.greenApp,
                                  ),
                                ),
                                //Black text
                                TextSpan(
                                  text: Strings(context).progressPageDoExam,
                                  style: GoogleFonts.montserrat(
                                    fontSize:
                                        Dimensions.getTextSize(context, 22),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                Strings(context).progressPageCongratulations,
                                style: GoogleFonts.montserrat(
                                  color: ColorsApp.greenApp,
                                  fontSize: Dimensions.getTextSize(context, 18),
                                ),
                              ),
                              Container(
                                width: Dimensions.getConvertedWidthSize(
                                    context, 220),
                                child: Text(
                                  Strings(context).progressPageCardTextDone,
                                  style: GoogleFonts.montserrat(
                                    fontSize:
                                        Dimensions.getTextSize(context, 18),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 25),
            ),
            // Cards of progress
            ProgressCardList(
              currentProgressStep: _verifyCurrentStep(),
              dietNavigation: widget.dietNavigation,
            ),
          ],
        ),
      ),
    );
  }

  ProgressStep _verifyCurrentStep() {
    if (difference > 3) {
      return ProgressStep.WaitingDiet;
    } else if (difference <= 3 && difference > 1) {
      return ProgressStep.Diet;
    } else if (difference < 1) {
      return ProgressStep.Fasting;
    } else {
      return ProgressStep.Exam;
    }
  }
}
