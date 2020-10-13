import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/diet-progress/presentation/models/progress_item.dart';
import 'package:provider/provider.dart';

class ProgressCard extends StatefulWidget {
  final ProgressItem item;
  final ProgressStep currentProgressStep;

  const ProgressCard({Key key, this.item, this.currentProgressStep})
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
          height: Dimensions.getConvertedHeightSize(
              context, widget.item.status == ProgressStatus.Current ? 25 : 15),
          width: Dimensions.getConvertedWidthSize(context, 25),
          decoration: BoxDecoration(
            color: widget.item.status == ProgressStatus.Future
                ? Colors.transparent
                : ColorsApp.greenApp,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.item.status == ProgressStatus.Future
                  ? Colors.grey
                  : ColorsApp.greenApp,
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
              color: widget.item.status == ProgressStatus.Future
                  ? null
                  : ColorsApp.greenApp,
              border: Border.all(
                width: widget.item.status == ProgressStatus.Future ? 1 : 0,
                color: widget.item.status == ProgressStatus.Future
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
                    children: <Widget>[
                      //Meal status icon
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: Dimensions.getEdgeInsetsAll(context, 5),
                              decoration: BoxDecoration(
                                color:
                                    widget.item.status == ProgressStatus.Future
                                        ? null
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Dimensions.getConvertedWidthSize(context, 50),
                                ),
                              ),
                              child: Icon(
                                _buildCardIcon(
                                    widget.item.status, widget.item.step),
                                size: Dimensions.getConvertedWidthSize(
                                    context, 25),
                                color:
                                    widget.item.status == ProgressStatus.Future
                                        ? null
                                        : ColorsApp.greenApp,
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
                                color:
                                    widget.item.status == ProgressStatus.Future
                                        ? null
                                        : Colors.white,
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
                          color: widget.item.status == ProgressStatus.Future
                              ? null
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
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.item.text,
                                style: TextStyle(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ),
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

  IconData _buildCardIcon(ProgressStatus status, ProgressStep step) {
    if (status == ProgressStatus.Done || step == ProgressStep.WaitingDiet) {
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
