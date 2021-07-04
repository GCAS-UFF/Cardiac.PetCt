import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/about-food/presentation/widgets/meal_item_card.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal_item.dart';
import 'package:provider/provider.dart';

class AllowedGroupFoodPage extends StatelessWidget {
  final List<UserMealItem> data;
  final String foodGroup;
  final String groupImage;

  const AllowedGroupFoodPage(
      {Key key, this.data, this.foodGroup, this.groupImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    data.map((data) {}).toList();
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
                        Strings(context).dietFood,
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
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.getTextSize(context, 20),
                              color: _themeChanger.getThemeData() == false
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: foodGroup,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.getTextSize(context, 18),
                              color: _themeChanger.getThemeData() == false
                                  ? Colors.black
                                  : Colors.white,
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
                      Strings(context).foodReplacementFood,
                      style: GoogleFonts.montserrat(
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
                    return UserMealItemCard(mealItem: data);
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
