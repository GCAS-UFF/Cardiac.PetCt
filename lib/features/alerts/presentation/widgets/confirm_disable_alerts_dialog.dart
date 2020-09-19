import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/ui/button_app.dart';

class ConfirmDisableAlertsDialog extends StatelessWidget {
  final Function returnValue;

  const ConfirmDisableAlertsDialog({Key key, this.returnValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (BuildContext context, double scale, Widget widget) {
          return Transform.scale(
            scale: scale,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.getConvertedWidthSize(context, 10),
                  ),
                ),
                padding:
                    Dimensions.getEdgeInsetsFromLTRB(context, 30, 30, 30, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Dialog title
                        Text(
                          "Desativar alertas",
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 20),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FeatherIcons.x,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(context, 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Tem certeza que deseja desativar todos os alertas ?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height:
                              Dimensions.getConvertedHeightSize(context, 20),
                        ),
                        //Send button
                        ButtonApp(
                          type: ButtonType.BUTTON_GREEN,
                          onPressed: () {
                            returnValue(true);
                            Navigator.pop(context);
                          },
                          title: "Desativar",
                        ),
                        SizedBox(
                          height:
                              Dimensions.getConvertedHeightSize(context, 10),
                        ),
                        ButtonApp(
                          type: ButtonType.BUTTON_ROUNDED,
                          onPressed: () {
                            returnValue(false);
                            Navigator.pop(context);
                          },
                          title: "Cancelar",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
