import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/features/alerts/presentation/mobx/controller.dart';
import 'package:petct/features/alerts/presentation/models/alert_model.dart';
import 'package:petct/features/alerts/presentation/widgets/confirm_disable_alerts_dialog.dart';

class AlertsPage extends StatelessWidget {
  final controller = Controller();
  @override
  Widget build(BuildContext context) {
    final List<AlertModel> alerts = [
      AlertModel(
          name: "Almoço",
          type: AlertType.MEALTIME,
          time: "12:00",
          discription:
              "Reference site about Lorem Ipsum, giving information on its origins,"),
      AlertModel(
          name: "Jejum",
          type: AlertType.PROGRESSCHANGE,
          time: "11:00",
          discription:
              "Reference site about Lorem Ipsum, giving information on its origins,"),
      AlertModel(
          name: "Almoço",
          type: AlertType.MEALTIME,
          time: "12:00",
          discription:
              "Reference site about Lorem Ipsum, giving information on its origins,"),
      AlertModel(
          name: "Jejum",
          type: AlertType.PROGRESSCHANGE,
          time: "11:00",
          discription:
              "Reference site about Lorem Ipsum, giving information on its origins,"),
    ];
    // final List<String> alerts = List<String>();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: Dimensions.getEdgeInsetsFromLTRB(context, 20, 35, 20, 0),
        decoration: BoxDecoration(),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Alertas",
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
                            size: Dimensions.getConvertedWidthSize(context, 25),
                            color: Colors.black,
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
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          Images.empty_alerts_image,
                          width: Dimensions.getConvertedWidthSize(context, 150),
                          height:
                              Dimensions.getConvertedHeightSize(context, 150),
                        ),
                        SizedBox(
                          height:
                              Dimensions.getConvertedHeightSize(context, 30),
                        ),
                        Text(
                          "Nenhum alerta",
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 18),
                          ),
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      padding: Dimensions.getEdgeInsets(context,top: 35),
                      child: Column(
                          children: alerts.map((data) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: data.type == AlertType.MEALTIME
                                  ? ColorsApp.greenApp
                                  : ColorsApp.dangerRed,
                              width:
                                  Dimensions.getConvertedWidthSize(context, 2),
                            ),
                            borderRadius: BorderRadius.circular(
                              Dimensions.getConvertedWidthSize(context, 10),
                            ),
                          ),
                          padding: Dimensions.getEdgeInsetsAll(context, 10),
                          margin: Dimensions.getEdgeInsets(context, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    data.type == AlertType.MEALTIME
                                        ? Icons.restaurant
                                        : FeatherIcons.alertTriangle,
                                    size: Dimensions.getConvertedWidthSize(
                                        context, 50),
                                    color: data.type == AlertType.MEALTIME
                                        ? ColorsApp.greenApp
                                        : ColorsApp.dangerRed,
                                  ),
                                  SizedBox(
                                    width: Dimensions.getConvertedWidthSize(
                                        context, 15),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                data.name,
                                                style: GoogleFonts.montserrat(
                                                  fontSize:
                                                      Dimensions.getTextSize(
                                                          context, 14),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              data.time,
                                              style: GoogleFonts.montserrat(
                                                fontSize:
                                                    Dimensions.getTextSize(
                                                        context, 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                data.discription,
                                                style: GoogleFonts.montserrat(
                                                  fontSize:
                                                      Dimensions.getTextSize(
                                                          context, 13),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              width: Dimensions
                                                  .getConvertedWidthSize(
                                                      context, 80),
                                              child: ButtonApp(
                                                title: "Ok",
                                                onPressed: null,
                                                type: ButtonType.BUTTON_ROUNDED,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList()),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
