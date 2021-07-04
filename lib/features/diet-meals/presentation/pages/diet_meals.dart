import 'package:intl/intl.dart';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/features/about-food/presentation/pages/about_food_page.dart';
import 'package:petct/features/diet-meals/presentation/models/classification.dart';
import 'package:petct/features/diet-meals/presentation/models/configuration.dart';
import 'package:petct/features/diet-meals/presentation/models/day.dart';
import 'package:petct/features/diet-meals/presentation/models/food.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_type.dart';
import 'package:petct/features/diet-meals/presentation/models/measurement_unit.dart';
import 'package:petct/features/diet-meals/presentation/models/menu.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';
import 'package:petct/features/diet-meals/presentation/widgets/custom_tabs.dart';
import 'package:petct/features/diet-meals/presentation/widgets/shopping_list_dialog.dart';
import 'package:petct/features/diet-meals/presentation/widgets/tab_menu_content.dart';
import 'package:petct/features/diet-meals/presentation/widgets/top_bar.dart';

class DietMeals extends StatefulWidget {
  @override
  _DietMealsState createState() => _DietMealsState();
}

class _DietMealsState extends State<DietMeals> with TickerProviderStateMixin {
  TabController _controller;
  Menu menu = Menu(meals: [
    UserMeal(
      mealItems: [
        UserMealItem(
          name: "Carne vermelha",
          foods: [
            Food(
                name: "Carne vermelha",
                classificationType: ClassificationType.PROTEIN),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.GRAMS,
          imagePath: Images.bread_forbidden,
        ),
        UserMealItem(
          name: "Carne vermelha",
          foods: [
            Food(
                name: "Carne vermelha",
                classificationType: ClassificationType.PROTEIN),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.GRAMS,
          imagePath: Images.bread_forbidden,
        ),
        UserMealItem(
          name: "Café preto",
          foods: [
            Food(
                name: "Café preto",
                classificationType: ClassificationType.LIQUID),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.MILLIMETER,
          imagePath: Images.bread_forbidden,
        )
      ],
      type: MealType(
        name: 'Café da manhã',
        type: MealTypeEnum.BREAKFAST,
      ),
    ),
    UserMeal(
      mealItems: [
        UserMealItem(
          name: "Carne vermelha",
          foods: [
            Food(
                name: "Carne vermelha",
                classificationType: ClassificationType.PROTEIN),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.GRAMS,
          imagePath: Images.bread_forbidden,
        ),
        UserMealItem(
          name: "Carne vermelha",
          foods: [
            Food(
                name: "Carne vermelha",
                classificationType: ClassificationType.FORBIDDEN),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.GRAMS,
          imagePath: Images.bread_forbidden,
        ),
        UserMealItem(
          name: "Café preto",
          foods: [
            Food(
                name: "Café preto",
                classificationType: ClassificationType.LIQUID),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.MILLIMETER,
          imagePath: Images.bread_forbidden,
        )
      ],
      type: MealType(
        name: 'Café da manhã',
        type: MealTypeEnum.BREAKFAST,
      ),
    ),
    UserMeal(
      mealItems: [
        UserMealItem(
          name: "Carne vermelha",
          foods: [
            Food(
                name: "Carne vermelha",
                classificationType: ClassificationType.PROTEIN),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.GRAMS,
          imagePath: Images.bread_forbidden,
        ),
        UserMealItem(
          name: "Carne vermelha",
          foods: [
            Food(
                name: "Carne vermelha",
                classificationType: ClassificationType.FORBIDDEN),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.GRAMS,
          imagePath: Images.bread_forbidden,
        ),
        UserMealItem(
          name: "Café preto",
          foods: [
            Food(
                name: "Café preto",
                classificationType: ClassificationType.LIQUID),
          ],
          portion: 100,
          measurementUnitType: MeasurementUnitType.MILLIMETER,
          imagePath: Images.bread_forbidden,
        )
      ],
      type: MealType(
        name: 'Café da manhã',
        type: MealTypeEnum.BREAKFAST,
      ),
    ),
  ]);
  Day dayOne;
  Day dayTwo;
  Day dayThree;
  Configuration configuration = Configuration(
    examDate: DateTime.now(),
    examLocal: "Av. Paulista, 1000. São Paulo - SP.",
    mealsTime: [
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
      DateTime.now()
    ],
    daysList: [
      Day(
        date: DateTime.now(),
        dayNumber: 1,
        dailyMeals: [
          UserMeal(
            mealItems: [
              UserMealItem(
                name: "Carne vermelha",
                foods: [
                  Food(
                      name: "Carne vermelha",
                      classificationType: ClassificationType.PROTEIN),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.GRAMS,
                imagePath: Images.bread_forbidden,
              ),
              UserMealItem(
                name: "Café preto",
                foods: [
                  Food(
                      name: "Café preto",
                      classificationType: ClassificationType.LIQUID),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.MILLIMETER,
                imagePath: Images.bread_forbidden,
              )
            ],
            type: MealType(
              name: 'Café da manhã',
              type: MealTypeEnum.BREAKFAST,
            ),
          ),
          UserMeal(
            mealItems: [
              UserMealItem(
                name: "Carne vermelha",
                foods: [
                  Food(
                      name: "Carne vermelha",
                      classificationType: ClassificationType.PROTEIN),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.GRAMS,
                imagePath: Images.bread_forbidden,
              ),
              UserMealItem(
                name: "Café preto",
                foods: [
                  Food(
                      name: "Café preto",
                      classificationType: ClassificationType.LIQUID),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.MILLIMETER,
                imagePath: Images.bread_forbidden,
              )
            ],
            type: MealType(
              name: 'Lanche da manhã',
              type: MealTypeEnum.MORNINGSNACK,
            ),
          ),
          UserMeal(
            mealItems: [
              UserMealItem(
                name: "Filé de frango",
                foods: [
                  Food(
                      name: "Filé de frango",
                      classificationType: ClassificationType.PROTEIN),
                ],
                portion: 150,
                measurementUnitType: MeasurementUnitType.GRAMS,
                imagePath: Images.bread_forbidden,
              ),
              UserMealItem(
                name: "Café preto",
                foods: [
                  Food(
                      name: "Café preto",
                      classificationType: ClassificationType.LIQUID),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.MILLIMETER,
                imagePath: Images.bread_forbidden,
              )
            ],
            type: MealType(
              name: 'Almoço',
              type: MealTypeEnum.LUNCH,
            ),
          ),
        ],
      ),
      Day(
        date: DateTime.now(),
        dayNumber: 2,
        dailyMeals: [
          UserMeal(
            mealItems: [
              UserMealItem(
                name: "Carne vermelha",
                foods: [
                  Food(
                      name: "Carne vermelha",
                      classificationType: ClassificationType.PROTEIN),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.GRAMS,
                imagePath: Images.bread_forbidden,
              ),
              UserMealItem(
                name: "Café preto",
                foods: [
                  Food(
                      name: "Café preto",
                      classificationType: ClassificationType.LIQUID),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.MILLIMETER,
                imagePath: Images.bread_forbidden,
              )
            ],
            type: MealType(
              name: 'Café da manhã',
              type: MealTypeEnum.BREAKFAST,
            ),
          ),
        ],
      ),
      Day(
        date: DateTime.now(),
        dayNumber: 3,
        dailyMeals: [
          UserMeal(
            mealItems: [
              UserMealItem(
                name: "Carne vermelha",
                foods: [
                  Food(
                      name: "Carne vermelha",
                      classificationType: ClassificationType.PROTEIN),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.GRAMS,
                imagePath: Images.bread_forbidden,
              ),
              UserMealItem(
                name: "Café preto",
                foods: [
                  Food(
                      name: "Café preto",
                      classificationType: ClassificationType.LIQUID),
                ],
                portion: 100,
                measurementUnitType: MeasurementUnitType.MILLIMETER,
                imagePath: Images.bread_forbidden,
              )
            ],
            type: MealType(
              name: 'Café da manhã',
              type: MealTypeEnum.BREAKFAST,
            ),
          ),
        ],
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    dayOne = configuration.daysList.firstWhere((e) => e.dayNumber == 1);
    dayTwo = configuration.daysList.firstWhere((e) => e.dayNumber == 2);
    dayThree = configuration.daysList.firstWhere((e) => e.dayNumber == 3);
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> _contents = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat('dd/MM').format(DateTime.now()),
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
          Text(
            Strings(context).firstDayTab,
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 16),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat('dd/MM').format(DateTime.now()),
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
          Text(
            Strings(context).secondDayTab,
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 16),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat('dd/MM').format(DateTime.now()),
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
          Text(
            Strings(context).thirdDayTab,
            style: GoogleFonts.montserrat(
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
            TopBar(),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 10),
            ),
            //About Diet Food
            ButtonApp(
              title: Strings(context).aboutFood,
              type: ButtonType.BUTTON_GREEN,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutFoodPage(),
                  ),
                );
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
                        daysMenu: configuration.daysList,
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
                  TabMenuContent(
                      day: configuration.daysList
                          .firstWhere((e) => e.dayNumber == 1),
                      allMeals: menu.meals),
                  // Second day tab menu content
                  TabMenuContent(
                    day: configuration.daysList
                        .firstWhere((e) => e.dayNumber == 2),
                      allMeals: menu.meals
                  ),
                  // Third day tab menu content
                  TabMenuContent(
                    day: configuration.daysList
                        .firstWhere((e) => e.dayNumber == 3),
                      allMeals: menu.meals
                  ),
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
