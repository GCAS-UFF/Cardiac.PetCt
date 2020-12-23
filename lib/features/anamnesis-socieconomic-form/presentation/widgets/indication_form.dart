import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/custom_dropdown.dart';

class IndicationForm extends StatefulWidget {
  @override
  _IndicationFormState createState() => _IndicationFormState();
}

class _IndicationFormState extends State<IndicationForm> {
    final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String indicationSource;
  List<DropdownMenuItem<String>> _listStates;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listStates = [
      DropdownMenuItem(
        value: 'state_sp',
        child: Text(
          "SP",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_rj',
        child: Text(
          "RJ",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_ro',
        child: Text(
          "RO",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_ac',
        child: Text(
          "AC",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_am',
        child: Text(
          "AM",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_rr',
        child: Text(
          "RR",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_pa',
        child: Text(
          "PA",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_ap',
        child: Text(
          "AP",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_to',
        child: Text(
          "TO",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_ma',
        child: Text(
          "MA",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_pi',
        child: Text(
          "PI",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_ce',
        child: Text(
          "CE",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_rn',
        child: Text(
          "RN",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_pb',
        child: Text(
          "PB",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_al',
        child: Text(
          "AL",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_se',
        child: Text(
          "SE",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_ba',
        child: Text(
          "BA",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_mg',
        child: Text(
          "MG",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_es',
        child: Text(
          "ES",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_pr',
        child: Text(
          "PR",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_sc',
        child: Text(
          "SC",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_rs',
        child: Text(
          "RS",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_ms',
        child: Text(
          "MS",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_mt',
        child: Text(
          "MT",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_go',
        child: Text(
          "GO",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'state_df',
        child: Text(
          "DF",
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
              Strings(context).anamnesisSocioeconomicLocationAndIndicationTitle,
              style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 20)),
            ),
            Expanded(
              child: Container(
                margin: Dimensions.getEdgeInsets(context, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings(context).anamnesisSocioeconomicUfAndStateQuestion,
                      style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 18),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(context, 10),
                    ),
                    Row(
                      children: [
                        Container(
                          height:
                              Dimensions.getConvertedHeightSize(context, 86),
                          width: Dimensions.getConvertedWidthSize(context, 100),
                          child: CustomDropdown(
                            value: _formData[Keys.UF_FORM],
                            hint: Text(
                              Strings(context).anamnesisSocioeconomicUfHint,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 16),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            options: _listStates,
                            onChange: (String value) {
                              setState(() {
                                _formData[Keys.UF_FORM] = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.getConvertedWidthSize(context, 10),
                        ),
                        Expanded(
                          child: Container(
                            height:
                                Dimensions.getConvertedHeightSize(context, 86),
                            child: CustomDropdown(
                              value: _formData[Keys.CITY_FORM],
                              hint: Text(
                                Strings(context).anamnesisSocioeconomicCityHint,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              options: _listStates,
                              onChange: (String value) {
                                setState(() {
                                  _formData[Keys.CITY_FORM] = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      Strings(context).anamnesisSocioeconomicIndicationQuestion,
                      style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 18),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(context, 10),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "medico",
                          groupValue: indicationSource,
                          onChanged: (value) {
                            setState(() {
                              indicationSource = value;
                            });
                          },
                        ),
                        Text(
                          "Médico",
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "amigo",
                          groupValue: indicationSource,
                          onChanged: (value) {
                            setState(() {
                              indicationSource = value;
                            });
                          },
                        ),
                        Text(
                          "Amigo",
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "redes_sociais",
                          groupValue: indicationSource,
                          onChanged: (value) {
                            setState(() {
                              indicationSource = value;
                            });
                          },
                        ),
                        Text(
                          "Redes sociais",
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "sites_busca",
                          groupValue: indicationSource,
                          onChanged: (value) {
                            setState(() {
                              indicationSource = value;
                            });
                          },
                        ),
                        Text(
                          "Sites de busca",
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "outro",
                          groupValue: indicationSource,
                          onChanged: (value) {
                            setState(() {
                              indicationSource = value;
                            });
                          },
                        ),
                        Text(
                          "Outro",
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.getTextSize(context, 16),
                          ),
                        ),
                      ],
                    )
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
