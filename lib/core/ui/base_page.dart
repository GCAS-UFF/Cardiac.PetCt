import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/diet-meals/presentation/pages/diet_meals.dart';
import 'package:petct/features/settings/pages/settings_screen.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentTab = 0;
  final _tabs = [
    Center(
      child: Text("Home"),
    ),
    DietMeals(),
    Center(
      child: Text("Notificações"),
    ),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          size: Dimensions.getConvertedWidthSize(context, 25),
        ),
        selectedIconTheme: IconThemeData(
          color: ColorsApp.greenApp,
          size: Dimensions.getConvertedWidthSize(context, 25),
        ),
        selectedFontSize: Dimensions.getTextSize(context, 16),
        unselectedFontSize: Dimensions.getTextSize(context, 16),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.home,
            ),
            title: Text(
              Strings(context).homeLabel,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.calendar,
              size: Dimensions.getConvertedWidthSize(context, 25),
            ),
            title: Text(
              Strings(context).menuLabel,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.alertCircle,
              size: Dimensions.getConvertedWidthSize(context, 25),
            ),
            title: Text(
              Strings(context).alertLabel,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.user,
              size: Dimensions.getConvertedWidthSize(context, 25),
            ),
            title: Text(
              Strings(context).settingsLabel,
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 14),
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
    );
  }
}
