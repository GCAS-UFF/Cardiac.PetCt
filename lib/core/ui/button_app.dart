import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:provider/provider.dart';

class ButtonApp extends StatelessWidget {
  final String title;
  final Function onPressed;
  final ButtonType type;
  final IconData preffixIcon;
  final IconData suffixIcon;

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
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            padding: Dimensions.getEdgeInsets(context, top: 12, bottom: 12),
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                color: (type == ButtonType.BUTTON_ROUNDED)
                    ? ColorsApp.greenApp
                    : Colors.transparent,
                width: Dimensions.getConvertedWidthSize(context, 2),
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.getConvertedWidthSize(context, 50),
              ),
            ),
            color:
                (type == ButtonType.BUTTON_GREEN) ? ColorsApp.greenApp : null,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.getTextSize(context, 16),
                    color: ((_themeChanger.getThemeData() == false) &&
                            (type == ButtonType.BUTTON_GREEN))
                        ? Colors.white
                        : (type == ButtonType.BUTTON_ROUNDED)
                            ? ColorsApp.greenApp
                            : Colors.black,
                  ),
                ),
                (suffixIcon != null)
                    ? Row(
                        children: <Widget>[
                          SizedBox(
                            width:
                                Dimensions.getConvertedWidthSize(context, 15),
                          ),
                          Icon(
                            suffixIcon,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                            color: ((_themeChanger.getThemeData() == false) &&
                                    (type == ButtonType.BUTTON_GREEN))
                                ? Colors.white
                                : (type == ButtonType.BUTTON_ROUNDED)
                                    ? ColorsApp.greenApp
                                    : Colors.black,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum ButtonType { BUTTON_GREEN, BUTTON_WHITE, BUTTON_ROUNDED }
