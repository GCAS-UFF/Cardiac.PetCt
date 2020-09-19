import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/about-food/presentation/widgets/food_card.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_item_model.dart';

class AllowedGroupFoodPage extends StatelessWidget {
  final List<MealItemModel> data;
  final String foodGroup;
  final String groupImage;

  const AllowedGroupFoodPage(
      {Key key, this.data, this.foodGroup, this.groupImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    data.map((data) {
      print(data.name);
    }).toList();
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 35, 40, 35, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Alimentos da dieta",
                        style: TextStyle(
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
                height: Dimensions.getConvertedHeightSize(context, 30),
              ),
              Row(
                children: [
                  Container(
                      height: Dimensions.getConvertedHeightSize(context, 60),
                      width: Dimensions.getConvertedWidthSize(context, 60),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(groupImage), fit: BoxFit.contain),
                      )),
                  SizedBox(
                    width: Dimensions.getConvertedWidthSize(context, 30),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: Strings(context).groupTitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.getTextSize(context, 20),
                            ),
                          ),
                          TextSpan(
                            text: foodGroup,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.getTextSize(context, 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 30),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Os itens desta lista podem ser substituidos por outro da mesma lista respeitando sua quantidade máxima por refeição",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 18),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              Wrap(
                  spacing: Dimensions.getConvertedWidthSize(context, 20),
                  runSpacing: Dimensions.getConvertedHeightSize(context, 20),
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: data.map((data) {
                    return FoodCard(data: data);
                  }).toList()),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
