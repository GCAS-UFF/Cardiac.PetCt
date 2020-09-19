import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, bottom: 5),
      decoration: BoxDecoration(
        //Underline logo name
        border: Border(
          bottom: BorderSide(
            color: ColorsApp.greenApp,
            width: Dimensions.getConvertedWidthSize(context, 2),
          ),
        ),
      ),
      //Logo name text
      child: Text(
        Strings(context).logoName,
        style: GoogleFonts.montserrat(
          fontSize: Dimensions.getTextSize(context, 20),
        ),
      ),
    );
  }
}
