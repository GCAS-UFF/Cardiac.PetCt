import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/alerts/presentation/mobx/controller.dart';
import 'package:petct/features/alerts/presentation/models/alert_model.dart';
import 'package:petct/features/alerts/presentation/widgets/alert_card.dart';
import 'package:petct/features/alerts/presentation/widgets/confirm_disable_alerts_dialog.dart';

class AlertsPage extends StatelessWidget {
  final controller = Controller();
  @override
  Widget build(BuildContext context) {
    final List<AlertModel> alerts = [
      // AlertModel(
      //   name: "Almoço",
      //   type: AlertType.MEALTIME,
      //   time: "12:00",
      //   discription:
      //       "Reference site about Lorem Ipsum, giving information on its origins,",
      // ),
    ];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 20, 35, 20, 0),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings(context).alertsTitle,
                    style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 18),
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return Container(
                        width: Dimensions.getConvertedWidthSize(context, 100),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              controller.enableAlerts.value == true
                                  ? FeatherIcons.bell
                                  : FeatherIcons.bellOff,
                              size:
                                  Dimensions.getConvertedWidthSize(context, 25),
                            ),
                            Switch(
                              activeColor: ColorsApp.greenApp,
                              value: controller.enableAlerts.value,
                              onChanged: (value) {
                                controller.enableAlerts.value == true
                                    ? showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return ConfirmDisableAlertsDialog(
                                            returnValue: (bool value) {
                                              value == true
                                                  ? controller.enableDisable()
                                                  : null;
                                            },
                                          );
                                        },
                                      )
                                    : controller.enableDisable();
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              (alerts.isEmpty)
                  ? Container(
                      padding: Dimensions.getEdgeInsets(context, top: 200),
                      child: Column(
                        children: <Widget>[
                          SvgPicture.asset(
                            Images.empty_alerts_image,
                            width:
                                Dimensions.getConvertedWidthSize(context, 150),
                            height:
                                Dimensions.getConvertedHeightSize(context, 150),
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 30),
                          ),
                          Text(
                            Strings(context).noAlert,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 18),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      padding: Dimensions.getEdgeInsets(context, top: 35),
                      child: Column(
                          children: alerts.map((data) {
                        return AlertCard(alert: data);
                      }).toList()),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
