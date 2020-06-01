import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/features/auth/presentation/pages/login_page.dart';

class VerifyEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        padding: Dimensions.getEdgeInsetsAll(context, 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Strings(context).verifyEmailTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.getTextSize(context, 22),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.getConvertedHeightSize(context, 20),
                  ),
                  Text(
                    Strings(context).verifyEmailText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.getTextSize(context, 18),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              Image(
                image: AssetImage(Images.email_sent),
              ),
              Padding(
                padding: Dimensions.getEdgeInsets(context, top: 70, bottom: 10),
                child: ButtonApp(
                  type: ButtonType.BUTTON_GREEN,
                  title: Strings(context).emailVerifiedLabel,
                  onPressed: () {
                    Route route = AnimationSlideTransistion(
                      widget: LoginPage(),
                    );
                    Navigator.push(context, route);
                  },
                ),
              ),
              ButtonApp(
                type: ButtonType.BUTTON_ROUNDED,
                title: Strings(context).resendLabel,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return _buildSendEmailDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSendEmailDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (BuildContext context, double scale, Widget widget) {
          return Transform.scale(
            scale: scale,
            child: Container(
              height: Dimensions.getConvertedHeightSize(context, 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Dimensions.getConvertedWidthSize(context, 10),
                ),
              ),
              padding: Dimensions.getEdgeInsets(context, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Email enviado com sucesso",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.getTextSize(context, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ButtonApp(
                    type: ButtonType.BUTTON_ROUNDED,
                    title: Strings(context).ok,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
