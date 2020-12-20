import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/diet-progress/presentation/models/progress_item.dart';
import 'package:provider/provider.dart';

class ProgressCard extends StatefulWidget {
  final ProgressItem item;
  final ProgressStep currentProgressStep;
  final Function dietNavigation;

  const ProgressCard(
      {Key key, this.item, this.currentProgressStep, this.dietNavigation})
      : super(key: key);
  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  bool _openCard = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Step point
        Container(
          margin: Dimensions.getEdgeInsets(context, top: 20),
          height: Dimensions.getConvertedHeightSize(context,
              widget.item.step == widget.currentProgressStep ? 25 : 15),
          width: Dimensions.getConvertedWidthSize(context, 25),
          decoration: BoxDecoration(
            color: widget.item.step == widget.currentProgressStep
                ? ColorsApp.greenApp
                : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.item.step == widget.currentProgressStep
                  ? ColorsApp.greenApp
                  : Colors.grey,
              width: Dimensions.getConvertedWidthSize(context, 2),
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.getConvertedWidthSize(context, 10),
        ),
        // Card
        Expanded(
          child: Container(
            margin: Dimensions.getEdgeInsets(context, bottom: 15),
            padding: Dimensions.getEdgeInsets(context, top: 15),
            decoration: BoxDecoration(
              color: widget.item.step == widget.currentProgressStep
                  ? ColorsApp.greenApp
                  : null,
              border: Border.all(
                width: widget.item.step == widget.currentProgressStep ? 1 : 0,
                color: widget.item.step == widget.currentProgressStep
                    ? Colors.transparent
                    : Colors.grey,
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
                    children: <Widget>[
                      //Meal status icon
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: Dimensions.getEdgeInsetsAll(context, 5),
                              decoration: BoxDecoration(
                                color: widget.item.step ==
                                        widget.currentProgressStep
                                    ? Colors.white
                                    : null,
                                borderRadius: BorderRadius.circular(
                                  Dimensions.getConvertedWidthSize(context, 50),
                                ),
                              ),
                              child: Icon(
                                _buildCardIcon(widget.item.step),
                                size: Dimensions.getConvertedWidthSize(
                                    context, 25),
                                color: widget.item.step ==
                                        widget.currentProgressStep
                                    ? ColorsApp.greenApp
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width:
                                  Dimensions.getConvertedWidthSize(context, 10),
                            ),
                            Text(
                              widget.item.title,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 16),
                                color: widget.item.step ==
                                        widget.currentProgressStep
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ],
                        ),
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
                          color: widget.item.step == widget.currentProgressStep
                              ? Colors.white
                              : null,
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
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.item.text,
                                    style: TextStyle(
                                      fontSize:
                                          Dimensions.getTextSize(context, 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.getConvertedHeightSize(
                                  context, 10),
                            ),
                            widget.item.step == ProgressStep.WaitingDiet
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Text(
                                              Strings(context).progressPageSeeDiet,
                                              style: TextStyle(
                                                fontSize:
                                                    Dimensions.getTextSize(
                                                        context, 16),
                                                color: ColorsApp.greenApp,
                                              ),
                                            ),
                                            Icon(
                                              FeatherIcons.arrowRight,
                                              color: ColorsApp.greenApp,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : widget.item.step == ProgressStep.Exam
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                FeatherIcons.clipboard,
                                                color: ColorsApp.greenApp,
                                              ),
                                              Text(
                                                Strings(context).progressPageGenerateDietHistory,
                                                style: TextStyle(
                                                  fontSize:
                                                      Dimensions.getTextSize(
                                                          context, 16),
                                                  color: ColorsApp.greenApp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Container()
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  IconData _buildCardIcon(ProgressStep step) {
    if (step == ProgressStep.WaitingDiet) {
      return FeatherIcons.check;
    } else if (step == ProgressStep.Diet) {
      return FeatherIcons.calendar;
    } else if (step == ProgressStep.Fasting) {
      return FeatherIcons.slash;
    } else {
      return FeatherIcons.activity;
    }
  }
}
