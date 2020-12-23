import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/base_page.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';

class AnamnesisSocioeconomicFinishPage extends StatefulWidget {
  @override
  _AnamnesisSocioeconomicFinishPageState createState() =>
      _AnamnesisSocioeconomicFinishPageState();
}

class _AnamnesisSocioeconomicFinishPageState
    extends State<AnamnesisSocioeconomicFinishPage> {
  Widget _buildBody(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsetsSymetric(context,
          vertical: 100, horizontal: 61),
      height: double.infinity,
      width: double.infinity,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    Strings(context).anamnesisSocieconomicFinishText,
                    style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 16),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              Images.finish_line_image,
              width: Dimensions.getConvertedWidthSize(context, 150),
              height: Dimensions.getConvertedHeightSize(context, 150),
            ),
            ButtonApp(
                title: Strings(context).anamnesisSocieconomicFinishLabelButton,
                onPressed: () {
                  Route route = AnimationSlideTransistion(
                    widget: BasePage(),
                  );
                  Navigator.push(context, route);
                },
                type: ButtonType.BUTTON_GREEN)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
