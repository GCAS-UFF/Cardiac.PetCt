import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';

class AlertButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Color color;
  const AlertButton({Key key, this.label, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: Dimensions.getEdgeInsetsFromLTRB(context, 5, 0, 5, 0),
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: Dimensions.getConvertedWidthSize(context, 1.5),
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.getConvertedWidthSize(context, 50),
            ),
          ),
          child: FlatButton(
            visualDensity: VisualDensity.compact,
            color: Colors.purple,
            padding: Dimensions.getEdgeInsetsAll(context, 0),
            onPressed: onTap,
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 16),
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
