import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/input_validators/empty_input_validator.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';

class PhysicalShapeForm extends StatefulWidget {
  final double weight;
  final double height;

  const PhysicalShapeForm({Key key, this.weight, this.height})
      : super(key: key);
  @override
  _PhysicalShapeFormState createState() => _PhysicalShapeFormState();
}

class _PhysicalShapeFormState extends State<PhysicalShapeForm> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _pesoController;
  TextEditingController _alturadController;

  @override
  void initState() {
    _pesoController = TextEditingController(text: _formData[Keys.WEIGHT_FORM]);
    _alturadController =
        TextEditingController(text: _formData[Keys.HEIGHT_FORM]);
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
              "Porte físico",
              style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 18)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Weight field
                  Container(
                    margin: Dimensions.getEdgeInsets(context, top: 25),
                    height: Dimensions.getConvertedHeightSize(context, 75),
                    child: CustomTextFormField(
                      text: "Peso",
                      textEditingController: _pesoController,
                      isRequired: true,
                      onChanged: (String value) {
                        _formData[Keys.WEIGHT_FORM] = value;
                      },
                      validator: EmptyInputValidator(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // Height field
                  Container(
                    height: Dimensions.getConvertedHeightSize(context, 75),
                    child: CustomTextFormField(
                      text: "Altura",
                      textEditingController: _alturadController,
                      isRequired: true,
                      onChanged: (String value) {
                        _formData[Keys.HEIGHT_FORM] = value;
                      },
                      keyboardType: TextInputType.number,
                    ),
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
