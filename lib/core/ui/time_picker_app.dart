import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:provider/provider.dart';

class TimePickerApp extends StatelessWidget {
  final String label;
  final String value;
  final Function onChange;

  const TimePickerApp({Key key, this.value, this.onChange, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Theme(
      data: ThemeData.light().copyWith(
        //Time picker color
        primaryColor: ColorsApp.greenApp,
      ),
      child: new Builder(
        builder: (context) => InkWell(
          onTap: () {
            //Show time picker action
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((time) {
              onChange(time);
            });
          },
          child: Stack(
            children: <Widget>[
              Container(
                width: Dimensions.getConvertedWidthSize(context, 165),
                padding: Dimensions.getEdgeInsets(context, right: 10, left: 15),
                margin: Dimensions.getEdgeInsets(context, top: 20, bottom: 20),
                height: Dimensions.getConvertedHeightSize(context, 50),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(
                    Dimensions.getConvertedWidthSize(context, 5),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        //Value
                        value == null ? "" : value.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(
                            context,
                            14,
                          ),
                        ),
                      ),
                    ),
                    //Dropdown icon
                    Icon(
                      Icons.arrow_drop_down,
                      size: Dimensions.getConvertedWidthSize(context, 30),
                      color: (_themeChanger.getThemeData() == false)
                          ? Colors.black
                          : Colors.white,
                    ),
                  ],
                ),
              ),
              // Label
              Positioned(
                top: Dimensions.getConvertedHeightSize(context, 11),
                left: Dimensions.getConvertedHeightSize(context, 10),
                child: Container(
                  padding: Dimensions.getEdgeInsetsAll(context, 3),
                  color: (_themeChanger.getThemeData() == false)
                      ? ColorsApp.lightBackground
                      : ColorsApp.darkBackground,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        label,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 15),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
