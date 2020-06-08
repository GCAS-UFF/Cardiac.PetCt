import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:provider/provider.dart';

class HighContrastButton extends StatefulWidget {
  @override
  _HighContrastButtonState createState() => _HighContrastButtonState();
}

class _HighContrastButtonState extends State<HighContrastButton> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return //High contrast button
        Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _themeChanger.changeTheme();
            });
          },
          child: Icon(
            Icons.brightness_high,
            size: Dimensions.getConvertedWidthSize(context, 25),
            color: _themeChanger.getThemeData() == true
                ? null
                : Colors.black.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
