import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/custom_dropdown.dart';

class IcomeMaritalStatusForm extends StatefulWidget {
  @override
  _IcomeMaritalStatusFormState createState() => _IcomeMaritalStatusFormState();
}

class _IcomeMaritalStatusFormState extends State<IcomeMaritalStatusForm> {
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
        value: 'ens_incompleto',
        child: Text(
          "Ensino médio incomplento",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'ens_completo',
        child: Text(
          "Ensino médio completo",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'graduacao_incompleta',
        child: Text(
          "Graduação incompleta",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'graduacao_completa',
        child: Text(
          "Graduação completa",
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'outro',
        child: Text(
          "Outro",
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
              Strings(context).anamnesisSocioeconomicPersonalDataTitle,
              style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 20)),
            ),
            Expanded(
              child: Container(
                margin: Dimensions.getEdgeInsets(context, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings(context).anamnesisSocioeconomicIncomeQuestion,
                      style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 18),
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "less_than_one",
                          groupValue: doPhysicalActivity,
                          onChanged: (value) {
                            setState(() {
                              doPhysicalActivity = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            Strings(context).anamnesisSocioeconomicLessThanOne,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "between_one_and_two",
                          groupValue: doPhysicalActivity,
                          onChanged: (value) {
                            setState(() {
                              doPhysicalActivity = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            Strings(context)
                                .anamnesisSocioeconomicBetweenOneAndTwo,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "between_three_and_five",
                          groupValue: doPhysicalActivity,
                          onChanged: (value) {
                            setState(() {
                              doPhysicalActivity = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            Strings(context)
                                .anamnesisSocioeconomicBetweenThreeAndFive,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "more_than_five",
                          groupValue: doPhysicalActivity,
                          onChanged: (value) {
                            setState(() {
                              doPhysicalActivity = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            Strings(context).anamnesisSocioeconomicMoreThanFive,
                            style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:
                              Dimensions.getConvertedHeightSize(context, 30),
                        ),
                        Text(
                          Strings(context).anamnesisSocioeconomicDegreeQuestion,
                          style: GoogleFonts.montserrat(
                              fontSize: Dimensions.getTextSize(context, 18),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height:
                              Dimensions.getConvertedHeightSize(context, 15),
                        ),
                        Container(
                          height:
                              Dimensions.getConvertedHeightSize(context, 86),
                          child: CustomDropdown(
                            value: _formData[Keys.DEGREE_FORM],
                            hint: Text(
                              Strings(context)
                                  .anamnesisSocioeconomicSelectDegreeHint,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 16),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            options: _list,
                            onChange: (String value) {
                              setState(() {
                                _formData[Keys.DEGREE_FORM] = value;
                              });
                            },
                          ),
                        ),
                        
                      ],
                    ),
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
