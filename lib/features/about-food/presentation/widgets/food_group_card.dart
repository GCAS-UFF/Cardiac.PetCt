import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

class FoodGroupCard extends StatelessWidget {
  final List<String> data;

  const FoodGroupCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: Dimensions.getEdgeInsets(context, bottom: 15),
          padding: Dimensions.getEdgeInsetsFromLTRB(context, 10, 20, 30, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Dimensions.getConvertedWidthSize(context, 10),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(.6),
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    data[2],
                    width: Dimensions.getConvertedWidthSize(context, 50),
                    height: Dimensions.getConvertedHeightSize(context, 50),
                  ),
                  SizedBox(
                    width: Dimensions.getConvertedWidthSize(context, 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: Strings(context).groupTitle,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.getTextSize(context, 16),
                              ),
                            ),
                            TextSpan(
                              text: data[0],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.getTextSize(context, 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 5),
                      ),
                      Text(
                        data[1],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Icon(
                FeatherIcons.chevronRight,
                size: Dimensions.getConvertedWidthSize(context, 30),
              ),
            ],
          ),
        );
  }
}