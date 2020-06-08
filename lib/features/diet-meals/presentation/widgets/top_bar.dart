import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/ui/high_contrast_button.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Tutorial Icon
          Icon(
            Icons.info_outline,
            size: Dimensions.getConvertedWidthSize(context, 25),
          ),
          // Meals title
          Text(
            "Refeições",
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 16),
            ),
          ),
          HighContrastButton(),
          // Shopping list Icon
          Icon(
            Icons.shopping_cart,
            size: Dimensions.getConvertedWidthSize(context, 25),
          ),
        ],
      ),
    );
  }
}
