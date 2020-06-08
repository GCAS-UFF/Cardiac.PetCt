import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
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
        //Tab Itens
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
            //First day tab
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
                      Strings(context).firstDayTab,
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Second day tab
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
                      Strings(context).secondDayTab,
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Third day tab
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
                      Strings(context).thirdDayTab,
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
