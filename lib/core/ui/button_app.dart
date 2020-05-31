import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';

class ButtonApp extends StatelessWidget {
  final String title;
  final Function onPressed;
  final ButtonType type;
  final Widget preffixIcon;
  final Widget suffixIcon;

  const ButtonApp({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.type,
    this.preffixIcon,
    this.suffixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            padding: Dimensions.getEdgeInsets(context, top: 12, bottom: 12),
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsApp.greenApp,
                width: Dimensions.getConvertedWidthSize(
                    context, (type == ButtonType.BUTTON_ROUNDED) ? 2 : 0),
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.getConvertedWidthSize(context, 50),
              ),
            ),
            color: (type == ButtonType.BUTTON_GREEN)
                ? ColorsApp.greenApp
                : Colors.white,
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                color: getColorText(),
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.getTextSize(context, 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color getColorText() {
    switch (type) {
      case ButtonType.BUTTON_GREEN:
        return Colors.white;
      case ButtonType.BUTTON_WHITE:
        return Colors.black;
      case ButtonType.BUTTON_ROUNDED:
        return ColorsApp.greenApp;
    }
  }
}

enum ButtonType { BUTTON_GREEN, BUTTON_WHITE, BUTTON_ROUNDED }
