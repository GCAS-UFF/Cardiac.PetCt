import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/auth/presentation/pages/recover_password_form.dart';
import 'package:petct/features/diet-meals/presentation/widgets/shopping_list_dialog.dart';

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
          SizedBox(
            width: Dimensions.getConvertedWidthSize(context, 15),
          ),
          // Meals title
          Text(
            Strings(context).mealsTitle,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 16),
            ),
          ),
          // Shopping list Icon
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return ShoppingListDialog();
                },
              );
            },
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  size: Dimensions.getConvertedWidthSize(context, 25),
                ),
                Text(
                  Strings(context).shoppingList,
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 11),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
