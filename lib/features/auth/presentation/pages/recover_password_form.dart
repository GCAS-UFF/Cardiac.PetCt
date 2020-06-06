import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petct/core/input_validators/email_input_validator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/app_name.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';
import 'package:petct/features/auth/presentation/bloc/auth_bloc.dart';

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
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (BuildContext context, double scale, Widget widget) {
          return Transform.scale(
            scale: scale,
            child: SingleChildScrollView(
              child: Container(
                height: Dimensions.getConvertedHeightSize(context, 500),
                decoration: BoxDecoration(
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
                      //Logo Image
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(Images.logo_image),
                            width:
                                Dimensions.getConvertedWidthSize(context, 70),
                          ),
                        ],
                      ),
                      // Dialog title
                      Text(
                        Strings(context).recoverPasswordTitle,
                        style: TextStyle(
                          fontSize: Dimensions.getTextSize(context, 22),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: Dimensions.getEdgeInsets(context,
                            top: 0, bottom: 20),
                        child: Column(
                          children: <Widget>[
                            (_errorMessage != null && _errorMessage != "")
                                ? Container(
                                    padding: Dimensions.getEdgeInsetsAll(
                                        context, 10),
                                    color: ColorsApp.greenApp,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          _recoverSuccess == true
                                              ? Icons.check
                                              : Icons.report_problem,
                                          color: Colors.white,
                                          size:
                                              Dimensions.getConvertedWidthSize(
                                                  context, 25),
                                        ),
                                        SizedBox(
                                          width:
                                              Dimensions.getConvertedWidthSize(
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
                              height: Dimensions.getConvertedHeightSize(
                                  context, 15),
                            ),
                            //Email textfield
                            Container(
                              height: Dimensions.getConvertedHeightSize(
                                  context, 70),
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
                              height: Dimensions.getConvertedHeightSize(
                                  context, 10),
                            ),
                            //Send button
                            ButtonApp(
                              type: ButtonType.BUTTON_GREEN,
                              onPressed: () {
                                _submitForm(context);
                              },
                              title: Strings(context).send,
                            ),
                            SizedBox(
                              height: Dimensions.getConvertedHeightSize(
                                  context, 25),
                            ),
                          ],
                        ),
                      ),
                      //Go back button
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_back,
                              size:
                                  Dimensions.getConvertedWidthSize(context, 16),
                            ),
                            SizedBox(
                              width:
                                  Dimensions.getConvertedWidthSize(context, 8),
                            ),
                            Text(
                              Strings(context).backOption,
                              style: TextStyle(
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
            ),
          );
        },
      ),
    );
  }

  // Validate email
  void _submitForm(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    BlocProvider.of<AuthBloc>(context)
        .add(RecoverPasswordEvent(email: _formData[Keys.LABEL_EMAIL]));

    Navigator.pop(context);
  }
}
