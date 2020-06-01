import 'package:flutter/material.dart';
import 'package:petct/core/input_validators/email_input_validator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';
import 'package:petct/features/auth/presentation/pages/recover_password_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool _obscureText = true;

  @override
  void initState() {
    _emailController = TextEditingController(text: _formData[Keys.LABEL_EMAIL]);
    _passwordController =
        TextEditingController(text: _formData[Keys.LABEL_PASSWORD]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: Dimensions.getEdgeInsets(context, top: 20, left: 10),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: Dimensions.getConvertedWidthSize(context, 30),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        padding: Dimensions.getEdgeInsetsAll(context, 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo image
                Image(
                  image: AssetImage(Images.logo_image),
                  width: Dimensions.getConvertedWidthSize(context, 140),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 15),
                ),
                //Title
                Text(
                  Strings(context).loginTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.getTextSize(context, 22),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Email field
                Padding(
                  padding:
                      Dimensions.getEdgeInsets(context, bottom: 20, top: 45),
                  child: CustomTextFormField(
                    text: Strings(context).emailLabel,
                    textEditingController: _emailController,
                    isRequired: true,
                    onChanged: (String value) {
                      _formData[Keys.LABEL_EMAIL] = value;
                    },
                    validator: EmailInputValidator(),
                  ),
                ),
                // Password field
                CustomTextFormField(
                  text: Strings(context).passwordLabel,
                  obscureText: _obscureText,
                  textEditingController: _passwordController,
                  // Changes password field visibility
                  suffixIcon: _obscureText
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            Icons.visibility_off,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                            color: Colors.grey,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            Icons.visibility,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                            color: ColorsApp.greenApp,
                          ),
                        ),
                  isRequired: true,
                  onChanged: (String value) {
                    _formData[Keys.LABEL_PASSWORD] = value;
                  },
                ),
                //Submit form button
                Padding(
                  padding:
                      Dimensions.getEdgeInsets(context, top: 20, bottom: 70),
                  child: ButtonApp(
                    title: Strings(context).signinLabelButton,
                    onPressed: () {
                      _submitFormLogin(context);
                    },
                    type: ButtonType.BUTTON_GREEN,
                  ),
                ),
                //Opens recover password dialog
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return RecoverPasswordForm();
                      },
                    );
                  },
                  child: Text(
                    Strings(context).forgotPassword,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.getTextSize(context, 16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Form submit function
  void _submitFormLogin(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }
}
