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
        Icon(
          Icons.brightness_high,
          size: Dimensions.getConvertedWidthSize(context, 25),
        ),
        Switch(
            value: _themeChanger.getThemeData(),
            onChanged: (bool data) {
              setState(() {
                _themeChanger.changeTheme();
              });
            }),
      ],
    );
  }
}
