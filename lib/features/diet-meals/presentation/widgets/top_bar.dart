import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, bottom: 10),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Meals title
              Text(
                "Dieta",
                style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 18),
                ),
              ),
            ],
          ),
          // Tutorial Icon
          Icon(
            FeatherIcons.info,
            size: Dimensions.getConvertedWidthSize(context, 25),
          ),
        ],
      ),
    );
  }
}
