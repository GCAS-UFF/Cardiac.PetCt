import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

class ComorbiditiesForm extends StatefulWidget {
  @override
  _ComorbiditiesFormState createState() => _ComorbiditiesFormState();
}

class _ComorbiditiesFormState extends State<ComorbiditiesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> comorbidities;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings(context).anamnesisSocioeconomicPersonalDataTitle,
              style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 20)),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings(context).anamnesisSocioeconomicComorbiditiesQuestion,
                  style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 18),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Radio(
                      value: "hipertensaoArterial",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesHypertensionOption,
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
                      value: "diabetes",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesDiabetesOption,
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
                      value: "doencaRenalCronica",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesRenalChronicDiseaseOption,
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
                      value: "doencaPulmonarObstrutivaCronica",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesPulmonaryChronicObstructiveDiseaseOption,
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
                      value: "asma",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesAsthmaOption,
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
                      value: "cancer",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesCancerOption,
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
                      value: "coleterolTriglicerideosElevados",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesHighCholesterolTriglyceridesOption,
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
                      value: "acidenteVascularCerebral",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesCerebroVascularAccidentOption,
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
                      value: "outraNaoListada",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesNotListedOption,
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
                      value: "nenhuma",
                      groupValue: comorbidities,
                      onChanged: (value) {
                        setState(() {
                          comorbidities = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        Strings(context)
                            .anamnesisSocioeconomicComorbiditiesNoneOption,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.getTextSize(context, 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
