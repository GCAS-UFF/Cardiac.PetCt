import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/diet-meals/presentation/models/meal_model.dart';
import 'package:petct/features/diet-meals/presentation/pages/choose_menu_page.dart';
import 'package:petct/features/diet-meals/presentation/pages/register_meal_page.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class MealCard extends StatefulWidget {
  final MealModel data;

  const MealCard({Key key, this.data}) : super(key: key);
  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool _openCard = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Container(
      margin: Dimensions.getEdgeInsets(context, bottom: 15),
      padding: Dimensions.getEdgeInsets(context, top: 15),
      decoration: BoxDecoration(
        color: (widget.data.status == MEALSTATUS.Recorded)
            ? ColorsApp.greenApp
            : (widget.data.status == MEALSTATUS.Pending)
                ? ColorsApp.dangerRed
                : null,
        border: Border.all(
          width: (widget.data.status == MEALSTATUS.Waiting) ? 1 : 0,
          color: (widget.data.status == MEALSTATUS.Waiting)
              ? Colors.grey
              : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.getConvertedWidthSize(context, 10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: Dimensions.getEdgeInsets(context,
                left: 20, right: 20, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Meal informations
                Row(
                  children: <Widget>[
                    //Meal status icon
                    Container(
                      padding: Dimensions.getEdgeInsetsAll(context, 5),
                      decoration: BoxDecoration(
                        color: (widget.data.status == MEALSTATUS.Waiting)
                            ? Colors.transparent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          Dimensions.getConvertedWidthSize(context, 50),
                        ),
                      ),
                      child: Icon(
                        (widget.data.status == MEALSTATUS.Recorded)
                            ? FeatherIcons.check
                            : FeatherIcons.clock,
                        color: (widget.data.status == MEALSTATUS.Recorded)
                            ? ColorsApp.greenApp
                            : (widget.data.status == MEALSTATUS.Pending)
                                ? ColorsApp.dangerRed
                                : Colors.grey,
                        size: Dimensions.getConvertedWidthSize(context, 25),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.getConvertedWidthSize(context, 10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            //Meal name
                            Text(
                              widget.data.name,
                              style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                  color: (widget.data.status ==
                                              MEALSTATUS.Waiting &&
                                          !_themeChanger.getThemeData())
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            Text(
                              " - ",
                              style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 14),
                                  color: (widget.data.status ==
                                              MEALSTATUS.Waiting &&
                                          !_themeChanger.getThemeData())
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            //Meal time
                            Text(
                              widget.data.mealTime,
                              style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                  color: (widget.data.status ==
                                              MEALSTATUS.Waiting &&
                                          !_themeChanger.getThemeData())
                                      ? Colors.black
                                      : Colors.white),
                            )
                          ],
                        ),
                        Text(
                          widget.data.status == MEALSTATUS.Recorded
                              ? Strings(context).recordedSubtitle
                              : widget.data.status == MEALSTATUS.Pending
                                  ? Strings(context).pendingSubtitle
                                  : Strings(context).waitingSubtitle,
                          style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 14),
                              color:
                                  (widget.data.status == MEALSTATUS.Waiting &&
                                          !_themeChanger.getThemeData())
                                      ? Colors.black
                                      : Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                //Meal options icon
                InkWell(
                  onTap: () {
                    setState(() {
                      _openCard = !_openCard;
                    });
                  },
                  child: Icon(
                    _openCard
                        ? FeatherIcons.minusSquare
                        : FeatherIcons.plusSquare,
                    size: Dimensions.getConvertedWidthSize(context, 24),
                    color: (widget.data.status == MEALSTATUS.Waiting&& !_themeChanger.getThemeData())
                        ? Colors.black
                        : Colors.white,
                  ),
                )
              ],
            ),
          ),
          _openCard
              ? Container(
                  decoration: BoxDecoration(
                    color: _themeChanger.getThemeData()
                        ? ColorsApp.darkBackground
                        : ColorsApp.lightBackground,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        Dimensions.getConvertedWidthSize(
                          context,
                          10,
                        ),
                      ),
                      bottomRight: Radius.circular(
                        Dimensions.getConvertedWidthSize(
                          context,
                          10,
                        ),
                      ),
                    ),
                  ),
                  padding: Dimensions.getEdgeInsetsAll(context, 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Ovos mexidos com manteiga + xícara de café sem açucar e sem adoçante",
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 16),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Meal itens title
                          Text(
                            Strings(context).ingredientsTitle,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          //Meal quantity title
                          Text(
                            Strings(context).quantityTitle,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        //Build meal itens
                        children: widget.data.mealItens.map((item) {
                          return MealItem(mealItem: item);
                        }).toList(),
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 15),
                      ),
                      ButtonApp(
                        title: Strings(context).chooseDish,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChooseMenuPage(
                                mealModel: widget.data,
                              ),
                            ),
                          );
                        },
                        type: ButtonType.BUTTON_ROUNDED,
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 5),
                      ),
                      ButtonApp(
                        title: Strings(context).addToDiary,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => RegisterMenuPage(
                                mealModel: widget.data,
                              ),
                            ),
                          );
                        },
                        type: ButtonType.BUTTON_GREEN,
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
