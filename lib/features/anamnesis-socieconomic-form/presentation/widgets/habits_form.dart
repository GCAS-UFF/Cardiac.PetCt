import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/input_validators/empty_input_validator.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';

class HealthHabitsForm extends StatefulWidget {
  @override
  _HealthHabitsFormState createState() => _HealthHabitsFormState();
}

class _HealthHabitsFormState extends State<HealthHabitsForm> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _anosFumandoController;
  TextEditingController _cigarrosDiaController;
  String isSmoker;
  String doDrink;
  String drinkQuantity;
  String drinkType;

  @override
  void initState() {
    _anosFumandoController =
        TextEditingController(text: _formData[Keys.WEIGHT_FORM]);
    _cigarrosDiaController =
        TextEditingController(text: _formData[Keys.HEIGHT_FORM]);
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
              Strings(context).anamnesisSocioeconomicHabitsTitle,
              style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 20)),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(context, 15),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings(context).anamnesisSocioeconomicIsSmokerQuestion,
                  style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 18),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Radio(
                      value: "nuncaFumou",
                      groupValue: isSmoker,
                      onChanged: (value) {
                        setState(() {
                          isSmoker = value;
                        });
                      },
                    ),
                    Text(
                      Strings(context)
                          .anamnesisSocioeconomicHabitsNeverSmokedOption,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "exFumante",
                      groupValue: isSmoker,
                      onChanged: (value) {
                        setState(() {
                          isSmoker = value;
                        });
                      },
                    ),
                    Text(
                      Strings(context)
                          .anamnesisSocioeconomicHabitsStoppedSmokingOption,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "fumante",
                      groupValue: isSmoker,
                      onChanged: (value) {
                        setState(() {
                          isSmoker = value;
                        });
                      },
                    ),
                    Text(
                      Strings(context)
                          .anamnesisSocioeconomicHabitsIsSmokerOption,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 16),
                      ),
                    ),
                  ],
                ),
                (isSmoker == "fumante")
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 15),
                          ),
                          Text(
                            Strings(context)
                                .anamnesisSocioeconomicHabitsYearsSmokingTitle,
                            style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 18)),
                          ),
                          Container(
                            margin: Dimensions.getEdgeInsets(context, top: 15),
                            height:
                                Dimensions.getConvertedHeightSize(context, 75),
                            child: CustomTextFormField(
                              text: Strings(context)
                                  .anamnesisSocioeconomicHabitsYearsSmokingHint,
                              textEditingController: _anosFumandoController,
                              isRequired: true,
                              onChanged: (String value) {
                                _formData[Keys.WEIGHT_FORM] = value;
                              },
                              validator: EmptyInputValidator(),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 15),
                          ),
                          Text(
                            Strings(context)
                                .anamnesisSocioeconomicHabitsDailyCigarretesTitle,
                            style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 18)),
                          ),
                          Container(
                            margin: Dimensions.getEdgeInsets(context, top: 15),
                            height:
                                Dimensions.getConvertedHeightSize(context, 75),
                            child: CustomTextFormField(
                              text: Strings(context)
                                  .anamnesisSocioeconomicHabitsDailyCigarretesHint,
                              textEditingController: _cigarrosDiaController,
                              isRequired: true,
                              onChanged: (String value) {
                                _formData[Keys.HEIGHT_FORM] = value;
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 15),
                ),
                Text(
                  Strings(context).anamnesisSocioeconomicDrinksQuestion,
                  style: GoogleFonts.montserrat(
                      fontSize: Dimensions.getTextSize(context, 18),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Radio(
                      value: "nao",
                      groupValue: doDrink,
                      onChanged: (value) {
                        setState(() {
                          doDrink = value;
                        });
                      },
                    ),
                    Text(
                      Strings(context).anamnesisSocioeconomicHabitsNeverOption,
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
                      groupValue: doDrink,
                      onChanged: (value) {
                        setState(() {
                          doDrink = value;
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
                      groupValue: doDrink,
                      onChanged: (value) {
                        setState(() {
                          doDrink = value;
                        });
                      },
                    ),
                    Text(
                      Strings(context).anamnesisSocioeconomicHabitsOftenOption,
                      style: GoogleFonts.montserrat(
                        fontSize: Dimensions.getTextSize(context, 16),
                      ),
                    ),
                  ],
                ),
                ((doDrink != null) && (doDrink != 'nao'))
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 15),
                          ),
                          Text(
                            Strings(context)
                                .anamnesisSocioeconomicHabitsTypeOfDrinkQuestion,
                            style: GoogleFonts.montserrat(
                                fontSize: Dimensions.getTextSize(context, 18),
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "cerveja",
                                groupValue: drinkType,
                                onChanged: (value) {
                                  setState(() {
                                    drinkType = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicHabitsDrinkBeerOption,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "vinho",
                                groupValue: drinkType,
                                onChanged: (value) {
                                  setState(() {
                                    drinkType = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicHabitsDrinkWineOption,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "cachaca",
                                groupValue: drinkType,
                                onChanged: (value) {
                                  setState(() {
                                    drinkType = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicHabitsDrinkCachacaOption,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "vodkaOrWhisky",
                                groupValue: drinkType,
                                onChanged: (value) {
                                  setState(() {
                                    drinkType = value;
                                  });
                                },
                              ),
                              Text(
                                Strings(context)
                                    .anamnesisSocioeconomicHabitsDrinkVodkaWhiskyOption,
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.getTextSize(context, 16),
                                ),
                              ),
                            ],
                          ),
                          (drinkType != null)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Dimensions.getConvertedHeightSize(
                                          context, 15),
                                    ),
                                    Text(
                                      Strings(context)
                                          .anamnesisSocioeconomicHabitsDrinkQuantityQuestion,
                                      style: GoogleFonts.montserrat(
                                          fontSize: Dimensions.getTextSize(
                                              context, 18),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: "ate1",
                                          groupValue: drinkQuantity,
                                          onChanged: (value) {
                                            setState(() {
                                              drinkQuantity = value;
                                            });
                                          },
                                        ),
                                        Text(
                                          (drinkType == "vinho")
                                              ? Strings(context)
                                                  .anamnesisSocioeconomicHabits1GlassDrinkOption
                                              : (drinkType == "cerveja")
                                                  ? Strings(context)
                                                      .anamnesisSocioeconomicHabits1CanDrinkOption
                                                  : Strings(context)
                                                      .anamnesisSocioeconomicHabits1DoseDrinkOption,
                                          style: GoogleFonts.montserrat(
                                            fontSize: Dimensions.getTextSize(
                                                context, 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: "1a3",
                                          groupValue: drinkQuantity,
                                          onChanged: (value) {
                                            setState(() {
                                              drinkQuantity = value;
                                            });
                                          },
                                        ),
                                        Text(
                                          (drinkType == "vinho")
                                              ? Strings(context)
                                                  .anamnesisSocioeconomicHabits1to3GlassDrinkOption
                                              : (drinkType == "cerveja")
                                                  ? Strings(context)
                                                      .anamnesisSocioeconomicHabits1to3CanDrinkOption
                                                  : Strings(context)
                                                      .anamnesisSocioeconomicHabits1to3DoseDrinkOption,
                                          style: GoogleFonts.montserrat(
                                            fontSize: Dimensions.getTextSize(
                                                context, 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: "maisQue3",
                                          groupValue: drinkQuantity,
                                          onChanged: (value) {
                                            setState(() {
                                              drinkQuantity = value;
                                            });
                                          },
                                        ),
                                        Text(
                                          (drinkType == "vinho")
                                              ? Strings(context)
                                                  .anamnesisSocioeconomicHabitsMoreThan3GlassDrinkOption
                                              : (drinkType == "cerveja")
                                                  ? Strings(context)
                                                      .anamnesisSocioeconomicHabitsMoreThan3CanDrinkOption
                                                  : Strings(context)
                                                      .anamnesisSocioeconomicHabitsMoreThan3DoseDrinkOption,
                                          style: GoogleFonts.montserrat(
                                            fontSize: Dimensions.getTextSize(
                                                context, 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
