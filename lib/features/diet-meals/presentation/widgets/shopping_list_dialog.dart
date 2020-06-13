import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';

class ShoppingListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double scale, Widget widget) {
        return Transform.scale(
          scale: scale,
          child: Dialog(
            child: SingleChildScrollView(
              child: Container(
                height: Dimensions.getConvertedHeightSize(context, 250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.getConvertedWidthSize(context, 10),
                  ),
                ),
                padding: Dimensions.getEdgeInsets(context,
                    top: 25, left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child:
                              // Dialog title
                              Text(
                            Strings(context).shoppingList,
                            style: TextStyle(
                              fontSize: Dimensions.getTextSize(context, 22),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // Close dialog icon
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Share button
                        ButtonApp(
                          title: Strings(context).shareTitle,
                          onPressed: () {},
                          type: ButtonType.BUTTON_GREEN,
                          suffixIcon: Icons.share,
                        ),
                        // Download button
                        ButtonApp(
                          title: Strings(context).downloadTitle,
                          onPressed: () {},
                          type: ButtonType.BUTTON_ROUNDED,
                          suffixIcon: Icons.file_download,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
