import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';

class CarouselSliderWidget extends StatelessWidget {
  final int currentIndex;
  final int totalIndex;

  const CarouselSliderWidget({Key key, this.currentIndex, this.totalIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < totalIndex; i++)
          Container(
            height: Dimensions.getConvertedHeightSize(context, 15),
            width: Dimensions.getConvertedWidthSize(context, 15),
            margin: Dimensions.getEdgeInsets(context, left: 2.5, right: 2.5),
            decoration: BoxDecoration(
              color: currentIndex == i ? ColorsApp.greenApp : null,
              shape: BoxShape.circle,
              border: Border.all(
                width: currentIndex == i ? 0 : 2,
                color: ColorsApp.greenApp,
              ),
            ),
          )
      ],
    );
  }
}
