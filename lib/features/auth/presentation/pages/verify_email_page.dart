import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/loading_widget.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/core/utils/failure_to_message_converter.dart';
import 'package:petct/features/auth/presentation/bloc/auth_bloc.dart';

class VerifyEmailPage extends StatelessWidget {
  Widget _buildBody(BuildContext context) {
    return Container(
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
                // Main title
                Text(
                  Strings(context).verifyEmailTitle,
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 22),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 20),
                ),
                // Verify email text
                Text(
                  Strings(context).verifyEmailText,
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 18),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 20),
            ),
            // Email image
            Image(
              image: AssetImage(
                Images.email_sent,
              ),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: Dimensions.getEdgeInsets(context, top: 70, bottom: 10),
              child:
                  // Email verified button
                  ButtonApp(
                type: ButtonType.BUTTON_GREEN,
                title: Strings(context).emailVerifiedLabel,
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context)
                      .add(ConfirmEmailVerifiedEvent());
                },
              ),
            ),
            // Resend email button
            ButtonApp(
              type: ButtonType.BUTTON_ROUNDED,
              title: Strings(context).resendLabel,
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(ResentEmailEvent());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _buildSendEmailDialog();
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
        if (state is Error) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                FailureToMessagesConverter().convert(context, state.failure),
              ),
            ),
          );
        } else if (state is Loaded) {
          Route route = AnimationSlideTransistion(
            widget: Scaffold(
              body: Center(child: Text("Home")),
            ),
          );
          Navigator.pushAndRemoveUntil(context, route, (r) => false);
        } else if (state is EmailResent) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return _buildSendEmailDialog();
            },
          );
        }
      }, child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            return LoadingWidget(_buildBody(context));
          } else {
            return _buildBody(context);
          }
        },
      )),
    );
  }

  Widget _buildSendEmailDialog() {
    return Dialog(
      // Scale animation
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (BuildContext context, double scale, Widget widget) {
          return Transform.scale(
            scale: scale,
            child: Container(
              height: Dimensions.getConvertedHeightSize(context, 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.getConvertedWidthSize(context, 10),
                ),
              ),
              padding: Dimensions.getEdgeInsets(context, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Resend email dialog title
                  Text(
                    Strings(context).recoverPasswordEmailSent,
                    style: TextStyle(
                      fontSize: Dimensions.getTextSize(context, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Close dialog button
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
