import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/diet-meals/presentation/models/menu_day_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/shopping_list_dialog.dart';

class TopBar extends StatelessWidget {
  final List<MenuDayModel> daysMenu;

  const TopBar({Key key, this.daysMenu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsets(context, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Tutorial Icon
          Icon(
            FeatherIcons.info,
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
                  return ShoppingListDialog(daysMenu: daysMenu,);
                },
              );
            },
            child: Column(
              children: <Widget>[
                Icon(
                  FeatherIcons.shoppingCart,
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
