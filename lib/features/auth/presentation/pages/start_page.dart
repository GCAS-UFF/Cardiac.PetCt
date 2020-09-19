import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/fonts.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/app_name.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/high_contrast_button.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/features/auth/presentation/pages/login_page.dart';
import 'package:petct/features/auth/presentation/pages/register_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 40, 40, 40, 40),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                //High contrast button
                HighContrastButton(),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 50),
                ),
                //Logo Image
                Image(
                  image: AssetImage(
                    Images.logo_image,
                  ),
                  width: Dimensions.getConvertedWidthSize(context, 150),
                ),
                SizedBox(
                  height: Dimensions.getConvertedWidthSize(context, 15),
                ),
                AppName(),
              ],
            ),
            //Introduction text
            Text(
              Strings(context).startPageParagraph,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 16),
              ),
            ),
            //Register page button
            Column(
              children: <Widget>[
                ButtonApp(
                  type: ButtonType.BUTTON_GREEN,
                  title: Strings(context).registerLabelButton,
                  onPressed: () {
                    Route route = AnimationSlideTransistion(
                      widget: RegisterPage(),
                    );
                    Navigator.push(context, route);
                  },
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 10),
                ),
                //Login page button
                ButtonApp(
                  title: Strings(context).signinLabelButton,
                  type: ButtonType.BUTTON_ROUNDED,
                  onPressed: () {
                    Route route = AnimationSlideTransistion(
                      widget: LoginPage(),
                    );
                    Navigator.push(context, route);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
