import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';

class NumberCounterWidget extends StatefulWidget {
  final bool enabled;

  const NumberCounterWidget({Key key, this.enabled}) : super(key: key);
  @override
  _NumberCounterWidgetState createState() => _NumberCounterWidgetState();
}

class _NumberCounterWidgetState extends State<NumberCounterWidget> {
  int _number = 200;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: widget.enabled
              ? () {
                  setState(() {
                    if (_number > 0) {
                      _number--;
                    }
                  });
                }
              : null,
          child: Icon(
            FeatherIcons.minusCircle,
            size: Dimensions.getConvertedWidthSize(context, 25),
            color: widget.enabled ? ColorsApp.greenApp : Colors.grey,
          ),
        ),
        SizedBox(
          width: Dimensions.getConvertedWidthSize(context, 15),
        ),
        Text(
          widget.enabled ? _number.toString() : "0",
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 18),
          ),
        ),
        SizedBox(
          width: Dimensions.getConvertedWidthSize(context, 15),
        ),
        InkWell(
          onTap: widget.enabled
              ? () {
                  setState(() {
                    _number++;
                  });
                }
              : null,
          child: Icon(
            FeatherIcons.plusCircle,
            size: Dimensions.getConvertedWidthSize(context, 25),
            color: widget.enabled ? ColorsApp.greenApp : Colors.grey,
          ),
        ),
      ],
    );
  }
}
