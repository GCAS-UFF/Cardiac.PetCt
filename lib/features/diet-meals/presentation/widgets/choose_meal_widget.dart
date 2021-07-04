import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';
import 'package:petct/features/diet-meals/presentation/widgets/custom_tabs.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_item_widget.dart';

class ChooseMealWidget extends StatefulWidget {
  final List<UserMeal> mealOptions;

  const ChooseMealWidget({Key key, this.mealOptions}) : super(key: key);
  @override
  _ChooseMealWidgetState createState() => _ChooseMealWidgetState();
}

class _ChooseMealWidgetState extends State<ChooseMealWidget>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = TabController(length: 3, vsync: this);

    List<Widget> _contents = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings(context).optionOne,
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings(context).optionTwo,
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings(context).optionThree,
            style: GoogleFonts.montserrat(
              fontSize: Dimensions.getTextSize(context, 14),
            ),
          ),
        ],
      ),
    ];
    return Expanded(
      child: Column(
        children: [
          CustomTabs(controller: _controller, tabContents: _contents),
          //Tab Contents
          Expanded(
            child: TabBarView(
                controller: _controller,
                children: widget.mealOptions.map((data) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: Dimensions.getEdgeInsetsAll(context, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //Meal itens title
                              Text(
                                Strings(context).itemTitle,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 12),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //Meal quantity title
                              Text(
                                Strings(context).quantityTitle,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 12),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            //Build meal itens
                            children: data.mealItems.map((item) {
                              return MealItemWidget(mealItem: item);
                            }).toList(),
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 20),
                          ),
                          ButtonApp(
                            title: Strings(context).chooseDish,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            type: ButtonType.BUTTON_GREEN,
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 5),
                          ),
                          ButtonApp(
                            title: Strings(context).cancel,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            type: ButtonType.BUTTON_ROUNDED,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
