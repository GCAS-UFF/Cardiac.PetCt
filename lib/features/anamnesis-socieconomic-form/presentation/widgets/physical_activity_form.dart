import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/custom_dropdown.dart';

class PhysicalActivityForm extends StatefulWidget {
  @override
  _PhysicalActivityFormState createState() => _PhysicalActivityFormState();
}

class _PhysicalActivityFormState extends State<PhysicalActivityForm> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String doPhysicalActivity;
  List<DropdownMenuItem<String>> _list;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _list = [
      DropdownMenuItem(
        value: 'musculacao',
        child: Text(
          "Musculação",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'corrida',
        child: Text(
          "Corrida",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'caminhada',
        child: Text(
          "Caminhada",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'volei',
        child: Text(
          "Vôlei",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'outra',
        child: Text(
          "Outra",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
    ];

    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings(context).anamnesisSocioeconomicPhysicalActivityTitle,
              style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 20)),
            ),
            Expanded(
              child: Container(
                margin: Dimensions.getEdgeInsets(context, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings(context)
                          .anamnesisSocioeconomicPhysicalActivityQuestion,
                      style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 18),
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "nunca",
                          groupValue: doPhysicalActivity,
                          onChanged: (value) {
                            setState(() {
                              doPhysicalActivity = value;
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
                          groupValue: doPhysicalActivity,
                          onChanged: (value) {
                            setState(() {
                              doPhysicalActivity = value;
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
                          groupValue: doPhysicalActivity,
                          onChanged: (value) {
                            setState(() {
                              doPhysicalActivity = value;
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
                    (doPhysicalActivity != 'nunca')
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Dimensions.getConvertedHeightSize(
                                    context, 30),
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicPhysicalActivityWichQuestion,
                                style: GoogleFonts.montserrat(
                                    fontSize:
                                        Dimensions.getTextSize(context, 18),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: Dimensions.getConvertedHeightSize(
                                    context, 15),
                              ),
                              Container(
                                height: Dimensions.getConvertedHeightSize(
                                    context, 86),
                                child: CustomDropdown(
                                  value: _formData[Keys.ACTIVITY_FORM],
                                  hint: Text(
                                    Strings(context)
                                        .anamnesisSocioeconomicWichActivityHint,
                                    style: GoogleFonts.montserrat(
                                      fontSize:
                                          Dimensions.getTextSize(context, 16),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  options: _list,
                                  onChange: (String value) {
                                    setState(() {
                                      _formData[Keys.ACTIVITY_FORM] = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
