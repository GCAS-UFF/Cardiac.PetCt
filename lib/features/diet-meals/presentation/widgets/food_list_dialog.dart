import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

class FoodListDialog extends StatelessWidget {
  final bool allowed;

  FoodListDialog({Key key, this.allowed}) : super(key: key);

  List<String> foodList = [
    "Pão de queijo",
    "Pão de sal",
    "Farinha branca",
    "Açucar",
    "Leite",
    "Biscoito",
    "Pão de queijo",
    "Pão de sal",
    "Farinha branca",
    "Açucar",
    "Leite",
    "Biscoito",
    "Pão de queijo",
    "Pão de sal",
    "Farinha branca",
    "Açucar",
    "Leite",
    "Biscoito",
    "Pão de queijo",
    "Pão de sal",
    "Farinha branca",
    "Açucar",
    "Leite",
    "Biscoito",
    "Pão de queijo",
    "Pão de sal",
    "Farinha branca",
    "Açucar",
    "Leite",
    "Biscoito",
  ];

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
                padding: Dimensions.getEdgeInsetsAll(context, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Dialog title
                        Text(
                          (allowed == true)
                              ? Strings(context).allowedFoodTitle
                              : Strings(context).forbiddenFoodTitle,
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 20),
                          ),
                        ),
                        //Dialog close button
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FeatherIcons.x,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(context, 25),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Food list
                      children: foodList.map((data) {
                        return Container(
                          margin: Dimensions.getEdgeInsets(context, bottom: 5),
                          child: Row(
                            children: <Widget>[
                              (allowed == true)
                                  ? Icon(
                                      FeatherIcons.check,
                                      color: Colors.green,
                                      size: Dimensions.getConvertedWidthSize(
                                          context, 15),
                                    )
                                  : Icon(
                                      FeatherIcons.slash,
                                      color: Colors.red,
                                      size: Dimensions.getConvertedWidthSize(
                                          context, 15),
                                    ),
                              SizedBox(
                                width: Dimensions.getConvertedWidthSize(
                                    context, 10),
                              ),
                              Text(
                                data,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
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
