import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/features/anamnesis-socieconomic-form/presentation/pages/anamnesis_form_root.dart';

class AnamnesisSocioeconomicStartPage extends StatefulWidget {
  @override
  _AnamnesisSocioeconomicStartPageState createState() =>
      _AnamnesisSocioeconomicStartPageState();
}

class _AnamnesisSocioeconomicStartPageState
    extends State<AnamnesisSocioeconomicStartPage> {
  Widget _buildBody(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsetsSymetric(context,
          vertical: 100, horizontal: 61),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  Strings(context).anamnesisSocieconomicText,
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.getTextSize(context, 16),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            Images.questions_image,
            width: Dimensions.getConvertedWidthSize(context, 150),
            height: Dimensions.getConvertedHeightSize(context, 150),
          ),
          ButtonApp(
              title: Strings(context).anamnesisSocieconomicLabelButton,
              onPressed: () {
                Route route = AnimationSlideTransistion(
                  widget: AnamnesisFormRoot(),
                );
                Navigator.push(context, route);
              },
              type: ButtonType.BUTTON_GREEN)
        ],
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
