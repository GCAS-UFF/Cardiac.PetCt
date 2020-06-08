import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:provider/provider.dart';

class DaysTabs extends StatelessWidget {
  final TabController controller;
  final List<String> mealsDate;

  const DaysTabs({Key key, this.controller, this.mealsDate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Column(
      children: <Widget>[
        TabBar(
          controller: controller,
          indicatorColor: ColorsApp.greenApp,
          labelColor: ColorsApp.greenApp,
          labelPadding: Dimensions.getEdgeInsetsFromLTRB(context, 0, 0, 0, 0),
          unselectedLabelColor: (_themeChanger.getThemeData() == true)
              ? Colors.white
              : Colors.black,
          indicatorPadding:
              Dimensions.getEdgeInsetsFromLTRB(context, 0, 0, 0, 0),
          tabs: [
            Tab(
              child: Column(
                children: <Widget>[
                  Text(
                    mealsDate[0],
                    style: TextStyle(
                      fontSize: Dimensions.getTextSize(context, 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Primeiro dia",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              child: Column(
                children: <Widget>[
                  Text(
                    mealsDate[1],
                    style: TextStyle(
                      fontSize: Dimensions.getTextSize(context, 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Segundo dia",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              child: Column(
                children: <Widget>[
                  Text(
                    mealsDate[2],
                    style: TextStyle(
                      fontSize: Dimensions.getTextSize(context, 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Terceiro dia",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
