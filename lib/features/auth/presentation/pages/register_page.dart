import 'package:flutter/material.dart';
import 'package:petct/core/input_validators/email_input_validator.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _birthController;
  TextEditingController _genderController;
  TextEditingController _passwordController;
  TextEditingController _repeatPasswordController;

  @override
  void initState() {
      // _emailController = TextEditingController(text: _formData[Keys.LABEL_EMAIL]);
      // _passwordController =
      //     TextEditingController(text: _formData[Keys.LABEL_PASSWORD]);
      // _nameController = TextEditingController(text: _formData[Keys.LABEL_NAME]);
      // _birthController = TextEditingController(text: _formData[Keys.LABEL_BIRTH]);
      // _genderController =
      //     TextEditingController(text: _formData[Keys.LABEL_GENDER]);
      // _repeatPasswordController =
      //     TextEditingController(text: _formData[Keys.LABEL_REPEATPASSWORD]);
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
            padding: Dimensions.getEdgeInsets(context, left: 10, top: 10),
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
        padding: Dimensions.getEdgeInsets(context, left: 20, right: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: TweenAnimationBuilder(
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              tween: Tween<double>(begin: 200, end: 0),
              builder: (BuildContext context, double translate, Widget widget) {
                return Transform.translate(
                  offset: Offset(translate, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        Strings(context).registerTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.getTextSize(context, 22),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 25),
                      ),
                      CustomTextFormField(
                        text: Strings(context).nameLabel,
                        textEditingController: _nameController,
                        isRequired: true,
                        onChanged: (String value) {
                          // _formData[Keys.LABEL_NAME] = value;
                        },
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 25),
                      ),
                      CustomTextFormField(
                        text: Strings(context).birthLabel,
                        obscureText: false,
                        textEditingController: _birthController,
                        isRequired: true,
                        onChanged: (String value) {
                          // _formData[Keys.LABEL_BIRTH] = value;
                        },
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 25),
                      ),
                      CustomTextFormField(
                        text: Strings(context).genderLabel,
                        textEditingController: _genderController,
                        isRequired: true,
                        onChanged: (String value) {
                          // _formData[Keys.LABEL_GENDER] = value;
                        },
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 25),
                      ),
                      CustomTextFormField(
                        text: Strings(context).emailLabel,
                        textEditingController: _emailController,
                        isRequired: true,
                        onChanged: (String value) {
                          _formData[Keys.LABEL_EMAIL] = value;
                        },
                        validator: EmailInputValidator(),
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 25),
                      ),
                      CustomTextFormField(
                        text: Strings(context).passwordLabel,
                        textEditingController: _passwordController,
                        isRequired: true,
                        onChanged: (String value) {
                          _formData[Keys.LABEL_PASSWORD] = value;
                        },
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 25),
                      ),
                      CustomTextFormField(
                        text: Strings(context).repeatPasswordLabel,
                        textEditingController: _repeatPasswordController,
                        obscureText: true,
                        isRequired: true,
                        onChanged: (String value) {
                          // _formData[Keys.LABEL_REPEATPASSWORD] = value;
                        },
                      ),
                      SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 30),
                      ),
                      ButtonApp(
                          title: Strings(context).registerLabelButton,
                          onPressed: () {
                            _submitFormLogin(context);
                          },
                          type: ButtonType.BUTTON_GREEN),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _submitFormLogin(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }
}
