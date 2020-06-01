import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/features/auth/presentation/pages/login_page.dart';
import 'package:petct/features/auth/presentation/pages/register_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 40, 80, 40, 40),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //Logo Image
            Image(
              image: AssetImage(
                Images.vertical_logo_named,
              ),
              width: Dimensions.getConvertedWidthSize(context, 150),
            ),

            //Introduction text
            Text(
              Strings(context).startPageParagraph,
              textAlign: TextAlign.center,
              style: TextStyle(
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
