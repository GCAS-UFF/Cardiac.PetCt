import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_model.dart';
import 'package:petct/features/diet-meals/presentation/models/menu_day_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/days_tabs.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';
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
            name: "Café da manhã",
            mealTime: "7:00",
            mealItens: [
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
              MealItemModel(name: "Maçã", quantity: "2 unid."),
              MealItemModel(name: "Torrada", quantity: "3 unid.")
            ],
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            name: "Lanche da manhã",
            mealTime: "9:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            status: MEALSTATUS.Recorded,
          ),
          MealModel(
            name: "Almoço",
            mealTime: "13:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            status: MEALSTATUS.Pending,
          ),
          MealModel(
            name: "Lanche da tarde",
            mealTime: "15:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Jantar",
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
        ],
      ),
      MenuDayModel(
        menuDay: "09/06",
        meals: [
          MealModel(
            name: "Café da manhã",
            mealTime: "6:30",
            mealItens: [
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Lanche da manhã",
            mealTime: "8:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Almoço",
            mealTime: "11:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Lanche da tarde",
            mealTime: "15:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Jantar",
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
        ],
      ),
      MenuDayModel(
        menuDay: "10/06",
        meals: [
          MealModel(
            name: "Café da manhã",
            mealTime: "7:45",
            mealItens: [
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Lanche da manhã",
            mealTime: "9:50",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Almoço",
            mealTime: "12:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Lanche da tarde",
            mealTime: "15:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
          MealModel(
            name: "Jantar",
            mealTime: "19:30",
            mealItens: [
              MealItemModel(name: "Suco de abacaxi", quantity: "500ml"),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Pão de forma", quantity: "2 unid."),
              MealItemModel(name: "Manga", quantity: "1 unid."),
              MealItemModel(name: "Suco de laranja", quantity: "500ml"),
              MealItemModel(name: "Pão de queijo", quantity: "3 unid."),
            ],
            status: MEALSTATUS.Waiting,
          ),
        ],
      ),
    ];
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: Dimensions.getEdgeInsetsFromLTRB(context, 20, 40, 20, 0),
      child: Container(
        child: Column(
          children: <Widget>[
            //Top Bar
            TopBar(),
            //Day Tabs
            DaysTabs(
              controller: _controller,
              mealsDate: [
                _daysMenu[0].menuDay,
                _daysMenu[1].menuDay,
                _daysMenu[2].menuDay
              ],
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
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
