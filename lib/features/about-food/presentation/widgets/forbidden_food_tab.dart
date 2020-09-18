import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';

class ForbiddenFoodContent extends StatelessWidget {
  List<List<String>> forbiddenFoodList = [
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
    ["Pão", Images.bread_forbidden],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: Dimensions.getEdgeInsets(context, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    FeatherIcons.alertTriangle,
                    size: Dimensions.getConvertedWidthSize(context, 27),
                    color: ColorsApp.dangerRed,
                  ),
                  SizedBox(
                    width: Dimensions.getConvertedWidthSize(context, 20),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Atenção!",
                          style: TextStyle(
                            color: ColorsApp.dangerRed,
                            fontSize: Dimensions.getTextSize(context, 18),
                          ),
                        ),
                        Text(
                          "Durante o período de dieta, a ingestão de qualquer um dos alimentos abaixo impede a realização do exame",
                          style: TextStyle(
                            fontSize: Dimensions.getTextSize(context, 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 25),
              ),
              Wrap(
                  spacing: Dimensions.getConvertedWidthSize(context, 20),
                  runSpacing: Dimensions.getConvertedHeightSize(context, 20),
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: forbiddenFoodList.map((data) {
                    return Stack(
                      children: [
                        Container(
                          height:
                              Dimensions.getConvertedHeightSize(context, 150),
                          width: Dimensions.getConvertedWidthSize(context, 150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.getConvertedWidthSize(context, 10),
                            ),
                            border: Border.all(
                              width:
                                  Dimensions.getConvertedWidthSize(context, 2),
                              color: Colors.grey[300],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                data[1],
                                width: Dimensions.getConvertedWidthSize(
                                    context, 70),
                              ),
                              SizedBox(
                                height: Dimensions.getConvertedHeightSize(
                                    context, 15),
                              ),
                              Text(
                                data[0],
                                style: TextStyle(
                                  fontSize: Dimensions.getTextSize(context, 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(
                            FeatherIcons.slash,
                            color: ColorsApp.dangerRed,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                          ),
                        ),
                      ],
                    );
                  }).toList()),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
