import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_model.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_item.dart';

class TabMenuContent extends StatefulWidget {
  final List<MealModel> meals;

  const TabMenuContent({Key key, this.meals}) : super(key: key);
  @override
  _TabMenuContentState createState() => _TabMenuContentState();
}

class _TabMenuContentState extends State<TabMenuContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: Dimensions.getEdgeInsets(context, top: 20),
        alignment: Alignment.bottomCenter,
        child: Column(
          //Build meals of the day
          children: widget.meals.map((data) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: Dimensions.getEdgeInsets(context, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: Dimensions.getConvertedWidthSize(context, 3),
                                                        color: (data.status == MEALSTATUS.Recorded)
                                ? Colors.green
                                : (data.status == MEALSTATUS.Pending)
                                    ? Colors.red
                                    : Colors.grey,
                          ),
                        ),
                      ),
                      //Meal informations
                      child: Row(
                        children: <Widget>[
                          //Meal status icon
                          Icon(
                            (data.status == MEALSTATUS.Recorded)
                                ? Icons.check_circle_outline
                                : Icons.alarm,
                            color: (data.status == MEALSTATUS.Recorded)
                                ? Colors.green
                                : (data.status == MEALSTATUS.Pending)
                                    ? Colors.red
                                    : Colors.grey,
                            size: Dimensions.getConvertedWidthSize(context, 30),
                          ),
                          SizedBox(
                            width:
                                Dimensions.getConvertedWidthSize(context, 10),
                          ),
                          Row(
                            children: <Widget>[
                              //Meal name
                              Text(
                                data.name,
                                style: TextStyle(
                                  fontSize: Dimensions.getTextSize(context, 18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " - ",
                                style: TextStyle(
                                  fontSize: Dimensions.getTextSize(context, 18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //Meal time
                              Text(
                                data.mealTime,
                                style: TextStyle(
                                  fontSize: Dimensions.getTextSize(context, 18),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Meal options icon
                    Icon(
                      Icons.more_vert,
                      size: Dimensions.getConvertedWidthSize(context, 24),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 20),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Meal itens title
                        Text(
                          Strings(context).itemTitle,
                          style: TextStyle(
                            fontSize: Dimensions.getTextSize(context, 14),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //Meal quantity title
                        Text(
                          Strings(context).quantityTitle,
                          style: TextStyle(
                            fontSize: Dimensions.getTextSize(context, 14),
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
                  ],
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 40),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
