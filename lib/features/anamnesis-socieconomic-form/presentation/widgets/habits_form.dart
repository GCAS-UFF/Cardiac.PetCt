import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

class HealthHabitsForm extends StatefulWidget {
  final double isSmoker;
  final double drinks;

  const HealthHabitsForm({Key key, this.isSmoker, this.drinks})
      : super(key: key);
  @override
  _HealthHabitsFormState createState() => _HealthHabitsFormState();
}

class _HealthHabitsFormState extends State<HealthHabitsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String isSmoker;
  String drinks;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings(context).anamnesisSocioeconomicHabitsTitle,
              style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 20)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings(context).anamnesisSocioeconomicDrinksQuestion,
                    style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 18),
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "nunca",
                        groupValue: drinks,
                        onChanged: (value) {
                          setState(() {
                            drinks = value;
                          });
                        },
                      ),
                      Text(
                        Strings(context)
                            .anamnesisSocioeconomicHabitsNeverOption,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "eventualmente",
                        groupValue: drinks,
                        onChanged: (value) {
                          setState(() {
                            drinks = value;
                          });
                        },
                      ),
                      Text(
                        Strings(context)
                            .anamnesisSocioeconomicHabitsEventuallyOption,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "frequentemente",
                        groupValue: drinks,
                        onChanged: (value) {
                          setState(() {
                            drinks = value;
                          });
                        },
                      ),
                      Text(
                        Strings(context)
                            .anamnesisSocioeconomicHabitsOftenOption,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.getConvertedHeightSize(context, 30),
                  ),
                  Text(
                    Strings(context).anamnesisSocioeconomicIsSmokerQuestion,
                    style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 18),
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "nunca",
                        groupValue: isSmoker,
                        onChanged: (value) {
                          setState(() {
                            isSmoker = value;
                          });
                        },
                      ),
                      Text(
                        Strings(context)
                            .anamnesisSocioeconomicHabitsNeverOption,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "eventualmente",
                        groupValue: isSmoker,
                        onChanged: (value) {
                          setState(() {
                            isSmoker = value;
                          });
                        },
                      ),
                      Text(
                        Strings(context)
                            .anamnesisSocioeconomicHabitsEventuallyOption,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "frequentemente",
                        groupValue: isSmoker,
                        onChanged: (value) {
                          setState(() {
                            isSmoker = value;
                          });
                        },
                      ),
                      Text(
                        Strings(context)
                            .anamnesisSocioeconomicHabitsOftenOption,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
