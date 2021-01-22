import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

class PhysicalActivityForm extends StatefulWidget {
  @override
  _PhysicalActivityFormState createState() => _PhysicalActivityFormState();
}

class _PhysicalActivityFormState extends State<PhysicalActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String doPhysicalActivity;
  String physicalActivityFrequency;

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
              Strings(context).anamnesisSocioeconomicPhysicalActivityTitle,
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
                  Strings(context)
                      .anamnesisSocioeconomicPhysicalActivityQuestion,
                  style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 18),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Radio(
                      value: "sim",
                      groupValue: doPhysicalActivity,
                      onChanged: (value) {
                        setState(() {
                          doPhysicalActivity = value;
                        });
                      },
                    ),
                    Text(
                      Strings(context).yes,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "nao",
                      groupValue: doPhysicalActivity,
                      onChanged: (value) {
                        setState(() {
                          doPhysicalActivity = value;
                        });
                      },
                    ),
                    Text(
                      Strings(context).no,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 16),
                      ),
                    ),
                  ],
                ),
                (doPhysicalActivity == 'sim')
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 15),
                          ),
                          Text(
                            Strings(context)
                                .anamnesisSocioeconomicPhysicalActivityFrequencyQuestion,
                            style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 18),
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "1a2",
                                groupValue: physicalActivityFrequency,
                                onChanged: (value) {
                                  setState(() {
                                    physicalActivityFrequency = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicPhysicalActivitiesFrequency1to2Option,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "3a4",
                                groupValue: physicalActivityFrequency,
                                onChanged: (value) {
                                  setState(() {
                                    physicalActivityFrequency = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicPhysicalActivitiesFrequency3to4Option,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "5a6",
                                groupValue: physicalActivityFrequency,
                                onChanged: (value) {
                                  setState(() {
                                    physicalActivityFrequency = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicPhysicalActivitiesFrequency5to6Option,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "7",
                                groupValue: physicalActivityFrequency,
                                onChanged: (value) {
                                  setState(() {
                                    physicalActivityFrequency = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicPhysicalActititiesFrequency7Option,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
