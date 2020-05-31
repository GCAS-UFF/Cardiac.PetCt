import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';

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
            Column(
              children: <Widget>[
                //Logo Image
                Image(
                  image: AssetImage(
                    Images.logo_image,
                  ),
                  width: Dimensions.getConvertedWidthSize(context, 81),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 15),
                ),
                //Principal title
                Text(
                  Strings(context).petctDiaryTitle,
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 22),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
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
                  onPressed: () {},
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 10),
                ),
                //Login page button
                ButtonApp(
                  title: Strings(context).signinLabelButton,
                  type: ButtonType.BUTTON_ROUNDED,
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
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
