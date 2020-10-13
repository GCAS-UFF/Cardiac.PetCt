import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/diet-progress/presentation/widgets/progress_cards_list.dart';
import 'package:provider/provider.dart';

class DietProgressPage extends StatefulWidget {
  @override
  _DietProgressPageState createState() => _DietProgressPageState();
}

class _DietProgressPageState extends State<DietProgressPage> {
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
              "Seu progresso",
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 20),
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 15),
            ),
            //Progress charts
            CircularPercentIndicator(
              radius: 145.0,
              lineWidth: 8.0,
              percent: 0.5,
              center: Text(
                "5",
                style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 50),
                ),
              ),
              backgroundColor: Colors.grey[300],
              progressColor: ColorsApp.greenApp,
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 15),
            ),
            //Current step text
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    color:
                        _themeChanger.getThemeData() ? Colors.white : Colors.black),
                children: [
                  //Black text
                  TextSpan(
                    text: "dias restantes para ",
                    style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 22),
                    ),
                  ),
                  //Green text
                  TextSpan(
                    text: "começar",
                    style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 22),
                      color: ColorsApp.greenApp,
                    ),
                  ),
                  //Black text
                  TextSpan(
                    text: " a dieta",
                    style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 22),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 25),
            ),
            // Cards of progress
            ProgressCardList(),
          ],
        ),
      ),
    );
  }
}
