import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:provider/provider.dart';

class CustomTabs extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabContents;

  const CustomTabs({Key key, this.controller, this.tabContents})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Column(
      children: <Widget>[
        //Tab Itens
        TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.getConvertedWidthSize(context, 50),
              ),
              color: ColorsApp.greenApp,
            ),
            labelColor: (_themeChanger.getThemeData() == false)
                ? Colors.white
                : Colors.black,
            labelPadding: Dimensions.getEdgeInsetsFromLTRB(context, 0, 0, 0, 0),
            unselectedLabelColor: (_themeChanger.getThemeData() == true)
                ? Colors.white
                : Colors.black,
            tabs: tabContents.map((data) {
              return Tab(
                child: data,
              );
            }).toList()),
      ],
    );
  }
}
