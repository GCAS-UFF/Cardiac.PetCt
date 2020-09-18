import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_model.dart';
import 'package:petct/features/diet-meals/presentation/models/menu_day_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/custom_tabs.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/shopping_list_dialog.dart';
import 'package:petct/features/diet-meals/presentation/widgets/tab_menu_content.dart';
import 'package:petct/features/diet-meals/presentation/widgets/top_bar.dart';

class DietMeals extends StatefulWidget {
  @override
  _DietMealsState createState() => _DietMealsState();
}

class _DietMealsState extends State<DietMeals>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<MenuDayModel> _daysMenu = List<MenuDayModel>();
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _daysMenu = [
      MenuDayModel(
        menuDay: "08/06",
        meals: [
          MealModel(
            mealTime: "7:00",
            mealItens: [
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
              MealItemModel(name: "Maçã", quantity: "2 unid."),
              MealItemModel(
                name: "Torrada",
                quantity: "3 unid.",
              )
            ],
            mealsName: MEALSNAME.Breakfast,
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            mealTime: "9:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            mealsName: MEALSNAME.MorningSnack,
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            mealTime: "13:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            mealsName: MEALSNAME.Lunch,
            status: MEALSTATUS.Pending,
          ),
          MealModel(
            mealTime: "15:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.AfternoonSnack,
            status: MEALSTATUS.Pending,
          ),
          MealModel(
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.Dinner,
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.Supper,
            status: MEALSTATUS.Waiting,
          ),
        ],
      ),
      MenuDayModel(
        menuDay: "08/06",
        meals: [
          MealModel(
            mealTime: "7:00",
            mealItens: [
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
              MealItemModel(name: "Maçã", quantity: "2 unid."),
              MealItemModel(
                name: "Torrada",
                quantity: "3 unid.",
              )
            ],
            mealsName: MEALSNAME.Breakfast,
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            mealTime: "9:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            mealsName: MEALSNAME.MorningSnack,
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            mealTime: "13:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            mealsName: MEALSNAME.Lunch,
            status: MEALSTATUS.Pending,
          ),
          MealModel(
            mealTime: "15:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.AfternoonSnack,
            status: MEALSTATUS.Pending,
          ),
          MealModel(
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.Dinner,
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.Supper,
            status: MEALSTATUS.Waiting,
          ),
        ],
      ),
      MenuDayModel(
        menuDay: "08/06",
        meals: [
          MealModel(
            mealTime: "7:00",
            mealItens: [
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
              MealItemModel(name: "Maçã", quantity: "2 unid."),
              MealItemModel(
                name: "Torrada",
                quantity: "3 unid.",
              )
            ],
            mealsName: MEALSNAME.Breakfast,
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            mealTime: "9:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            mealsName: MEALSNAME.MorningSnack,
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            mealTime: "13:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            mealsName: MEALSNAME.Lunch,
            status: MEALSTATUS.Pending,
          ),
          MealModel(
            mealTime: "15:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.AfternoonSnack,
            status: MEALSTATUS.Pending,
          ),
          MealModel(
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.Dinner,
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            mealsName: MEALSNAME.Supper,
            status: MEALSTATUS.Waiting,
          ),
        ],
      ),
    ];
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> _contents = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _daysMenu[0].menuDay,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
          Text(
            Strings(context).firstDayTab,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 16),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _daysMenu[1].menuDay,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
          Text(
            Strings(context).secondDayTab,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 16),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _daysMenu[2].menuDay,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
          Text(
            Strings(context).thirdDayTab,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 16),
            ),
          ),
        ],
      ),
    ];
    return Container(
      height: double.infinity,
      padding: Dimensions.getEdgeInsetsFromLTRB(context, 20, 40, 20, 0),
      child: Container(
        child: Column(
          children: <Widget>[
            //Top Bar
            TopBar(
              daysMenu: _daysMenu,
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 10),
            ),
            //About Diet Food
            ButtonApp(
              title: Strings(context).aboutFood,
              type: ButtonType.BUTTON_GREEN,
              onPressed: () {
                Navigator.pushNamed(context, '/aboutFoodPage');
              },
              suffixIcon: Icons.arrow_forward,
            ),
            //Shopping List Button
            Padding(
              padding: Dimensions.getEdgeInsets(context, top: 15, bottom: 15),
              child: ButtonApp(
                title: Strings(context).shoppingList,
                type: ButtonType.BUTTON_ROUNDED,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return ShoppingListDialog(
                        daysMenu: _daysMenu,
                      );
                    },
                  );
                },
                preffixIcon: FeatherIcons.shoppingCart,
              ),
            ),
            //Day Tabs
            CustomTabs(
              controller: _controller,
              tabContents: _contents,
            ),
            //Tab Contents
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  // First day tab menu content
                  TabMenuContent(meals: _daysMenu[0].meals),
                  // Second day tab menu content
                  TabMenuContent(meals: _daysMenu[1].meals),
                  // Third day tab menu content
                  TabMenuContent(meals: _daysMenu[2].meals),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
