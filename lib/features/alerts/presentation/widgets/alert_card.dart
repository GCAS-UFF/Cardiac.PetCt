import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/alerts/presentation/models/alert_model.dart';

import 'alert_button.dart';

class AlertCard extends StatelessWidget {
  final AlertModel alert;

  const AlertCard({Key key, this.alert}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: alert.type == AlertType.MEALTIME
              ? ColorsApp.greenApp
              : ColorsApp.dangerRed,
          width: Dimensions.getConvertedWidthSize(context, 2),
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.getConvertedWidthSize(context, 10),
        ),
      ),
      padding: Dimensions.getEdgeInsetsAll(context, 15),
      margin: Dimensions.getEdgeInsets(context, bottom: 10),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                alert.type == AlertType.MEALTIME
                    ? Icons.restaurant
                    : FeatherIcons.alertTriangle,
                size: Dimensions.getConvertedWidthSize(context, 50),
                color: alert.type == AlertType.MEALTIME
                    ? ColorsApp.greenApp
                    : ColorsApp.dangerRed,
              ),
              SizedBox(
                width: Dimensions.getConvertedWidthSize(context, 15),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            alert.name,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          alert.time,
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 13),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(context, 10),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            alert.discription,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(context, 10),
                    ),
                    AlertButton(
                      label:
                          alert.type == AlertType.MEALTIME ? Strings(context).registerLabel : Strings(context).okLabel,
                      onTap: null,
                      color: alert.type == AlertType.MEALTIME
                          ? ColorsApp.greenApp
                          : ColorsApp.dangerRed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
