import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/custom_tabs.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_item.dart';

class ChooseMenuPage extends StatefulWidget {
  final MealModel mealModel;

  const ChooseMenuPage({Key key, this.mealModel}) : super(key: key);
  @override
  _ChooseMenuPageState createState() => _ChooseMenuPageState();
}

class _ChooseMenuPageState extends State<ChooseMenuPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<MealModel> _optionsMenu = List<MealModel>();
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _optionsMenu = [
      MealModel(
        mealTime: "7:00",
        mealItens: [
          MealItemModel(0.0,
              name: "Azeite",
              group: FoodGroup.OILS,
              image: Images.bread_forbidden,
              measurement: Measurement.MILLIMETER),
          MealItemModel(0.0,
              name: "Café",
              group: FoodGroup.LIQUID,
              image: Images.bread_forbidden,
              measurement: Measurement.MILLIMETER),
          MealItemModel(0.0,
              name: "Alface",
              group: FoodGroup.VEGETABLES,
              image: Images.bread_forbidden,
              measurement: Measurement.GRAMS),
          MealItemModel(0.0,
              name: "Carne bovina",
              group: FoodGroup.PROTEIN,
              image: Images.bread_forbidden,
              measurement: Measurement.GRAMS),
          MealItemModel(0.0,
              name: "Gorgonzola",
              group: FoodGroup.CHEESE,
              image: Images.bread_forbidden,
              measurement: Measurement.UNITY),
        ],
        mealsName: MEALSNAME.Breakfast,
        status: MEALSTATUS.Recorded,
      ),
      MealModel(
        mealTime: "9:30",
        mealItens: [
          MealItemModel(0.0,
              name: "Azeite",
              group: FoodGroup.OILS,
              image: Images.bread_forbidden,
              measurement: Measurement.MILLIMETER),
          MealItemModel(0.0,
              name: "Café",
              group: FoodGroup.LIQUID,
              image: Images.bread_forbidden,
              measurement: Measurement.MILLIMETER),
          MealItemModel(0.0,
              name: "Alface",
              group: FoodGroup.VEGETABLES,
              image: Images.bread_forbidden,
              measurement: Measurement.GRAMS),
          MealItemModel(0.0,
              name: "Carne bovina",
              group: FoodGroup.PROTEIN,
              image: Images.bread_forbidden,
              measurement: Measurement.GRAMS),
          MealItemModel(0.0,
              name: "Gorgonzola",
              group: FoodGroup.CHEESE,
              image: Images.bread_forbidden,
              measurement: Measurement.UNITY),
        ],
        mealsName: MEALSNAME.Breakfast,
        status: MEALSTATUS.Recorded,
      ),
      MealModel(
        mealTime: "13:30",
        mealItens: [
          MealItemModel(0.0,
              name: "Azeite",
              group: FoodGroup.OILS,
              image: Images.bread_forbidden,
              measurement: Measurement.MILLIMETER),
          MealItemModel(0.0,
              name: "Café",
              group: FoodGroup.LIQUID,
              image: Images.bread_forbidden,
              measurement: Measurement.MILLIMETER),
          MealItemModel(0.0,
              name: "Alface",
              group: FoodGroup.VEGETABLES,
              image: Images.bread_forbidden,
              measurement: Measurement.GRAMS),
          MealItemModel(0.0,
              name: "Carne bovina",
              group: FoodGroup.PROTEIN,
              image: Images.bread_forbidden,
              measurement: Measurement.GRAMS),
          MealItemModel(0.0,
              name: "Gorgonzola",
              group: FoodGroup.CHEESE,
              image: Images.bread_forbidden,
              measurement: Measurement.UNITY),
        ],
        mealsName: MEALSNAME.Breakfast,
        status: MEALSTATUS.Pending,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: Container(
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 30, 30, 30, 0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Strings(context).chooseDish,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: Dimensions.getConvertedWidthSize(context, 24),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Meal name
                Text(
                  widget.mealModel.name,
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.getTextSize(context, 20),
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.greenApp,
                  ),
                ),
                Text(
                  " - ",
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.getTextSize(context, 20),
                    color: ColorsApp.greenApp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Meal time
                Text(
                  widget.mealModel.mealTime,
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.getTextSize(context, 20),
                    color: ColorsApp.greenApp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 5),
            ),
            Text(
              Strings(context).firstDay,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 16),
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 20),
            ),
            CustomTabs(controller: _controller, tabContents: _contents),
            //Tab Contents
            Expanded(
              child: TabBarView(
                  controller: _controller,
                  children: _optionsMenu.map((data) {
                    return Container(
                      padding: Dimensions.getEdgeInsetsAll(context, 20),
                      child: Column(
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
                            children: data.mealItens.map((item) {
                              return MealItem(mealItem: item);
                            }).toList(),
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 15),
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
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
