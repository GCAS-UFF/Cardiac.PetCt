import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/diet-meals/presentation/pages/diet_meals.dart';

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
    Center(
      child: Text("Perfil"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: Dimensions.getConvertedWidthSize(context, 25),
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: Dimensions.getConvertedWidthSize(context, 25),
        ),
        selectedFontSize: Dimensions.getTextSize(context, 18),
        unselectedFontSize: Dimensions.getTextSize(context, 18),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.home,
              color: ColorsApp.greenApp,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 18),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.calendar,
              color: ColorsApp.greenApp,
              size: Dimensions.getConvertedWidthSize(context, 25),
            ),
            title: Text(
              "Dieta",
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 18),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.alertCircle,
              color: ColorsApp.greenApp,
              size: Dimensions.getConvertedWidthSize(context, 25),
            ),
            title: Text(
              "Alertas",
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 18),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.user,
              color: ColorsApp.greenApp,
              size: Dimensions.getConvertedWidthSize(context, 25),
            ),
            title: Text(
              "Perfil",
              style: TextStyle(
                fontSize: Dimensions.getTextSize(context, 18),
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
