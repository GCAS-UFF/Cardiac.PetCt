import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

import 'food_list_dialog.dart';

class FoodListButton extends StatelessWidget {
  final bool allowed;

  const FoodListButton({Key key, this.allowed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return FoodListDialog(
              allowed: allowed,
            );
          },
        );
      },
      child: Container(
        margin: Dimensions.getEdgeInsets(context, bottom: 20, top: 20),
        padding: Dimensions.getEdgeInsets(context, top: 5, bottom: 5),
        width: Dimensions.getConvertedWidthSize(context, 130),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(
            Dimensions.getConvertedWidthSize(context, 50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Buton Icon
            (allowed == true)
                ? Icon(
                    FeatherIcons.check,
                    color: Colors.green,
                    size: Dimensions.getConvertedWidthSize(context, 20),
                  )
                : Icon(
                    FeatherIcons.slash,
                    color: Colors.red,
                    size: Dimensions.getConvertedWidthSize(context, 20),
                  ),
            SizedBox(
              width: Dimensions.getConvertedWidthSize(context, 10),
            ),
            // Buton Label
            Text(
              (allowed == true)
                  ? Strings(context).allowedLabel
                  : Strings(context).forbiddenLabel,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
