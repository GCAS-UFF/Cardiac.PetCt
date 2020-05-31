import 'package:flutter/material.dart';
import 'package:petct/core/input_validators/email_input_validator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';

class RecoverPasswordForm extends StatefulWidget {
  @override
  _RecoverPasswordFormState createState() => _RecoverPasswordFormState();
}

class _RecoverPasswordFormState extends State<RecoverPasswordForm> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController;

  String _errorMessage;

  bool _recoverSuccess = false;

  @override
  void initState() {
    _emailController = TextEditingController(text: _formData[Keys.LABEL_EMAIL]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (BuildContext context, double scale, Widget widget) {
          return Transform.scale(
            scale: scale,
            child: Container(
              height: Dimensions.getConvertedHeightSize(context, 500),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Dimensions.getConvertedWidthSize(context, 10),
                ),
              ),
              padding: Dimensions.getEdgeInsets(context,
                  top: 50, left: 20, right: 20, bottom: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(Images.logo_image),
                      width: Dimensions.getConvertedWidthSize(context, 70),
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(context, 15),
                    ),
                    Text(
                      "Recuperar senha",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 22),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin:
                          Dimensions.getEdgeInsets(context, top: 0, bottom: 20),
                      child: Column(
                        children: <Widget>[
                          (_errorMessage != null && _errorMessage != "")
                              ? Container(
                                  padding:
                                      Dimensions.getEdgeInsetsAll(context, 10),
                                  color: ColorsApp.greenApp,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        _recoverSuccess == true
                                            ? Icons.check
                                            : Icons.report_problem,
                                        color: Colors.white,
                                        size: Dimensions.getConvertedWidthSize(
                                            context, 25),
                                      ),
                                      SizedBox(
                                        width: Dimensions.getConvertedWidthSize(
                                            context, 10),
                                      ),
                                      Expanded(
                                        child: Text(
                                          _errorMessage,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.getTextSize(
                                                context, 11),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 15),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: Dimensions.getConvertedHeightSize(
                                  context, 65),
                            ),
                            child: CustomTextFormField(
                              textEditingController: _emailController,
                              text: Strings(context).emailLabel,
                              isRequired: true,
                              onChanged: (String value) {
                                _formData[Keys.LABEL_EMAIL] = value.trim();
                              },
                              validator: EmailInputValidator(),
                            ),
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 10),
                          ),
                          ButtonApp(
                            onPressed: () {
                              _submitForm(context);
                            },
                            title: "Enviar",
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(context, 25),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back,
                            color: ColorsApp.greenApp,
                            size: Dimensions.getConvertedWidthSize(context, 16),
                          ),
                          SizedBox(
                            width: Dimensions.getConvertedWidthSize(context, 8),
                          ),
                          Text(
                            "Voltar",
                            style: TextStyle(
                              color: ColorsApp.greenApp,
                              fontSize: Dimensions.getTextSize(context, 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }
}
