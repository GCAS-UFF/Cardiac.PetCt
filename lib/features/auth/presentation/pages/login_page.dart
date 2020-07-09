import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petct/core/input_validators/email_input_validator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';
import 'package:petct/core/ui/high_contrast_button.dart';
import 'package:petct/core/ui/loading_widget.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/core/utils/failure_to_message_converter.dart';
import 'package:petct/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petct/features/auth/presentation/pages/recover_password_form.dart';
import 'package:petct/features/auth/presentation/pages/verify_email_page.dart';
import 'package:petct/features/intro-form/pages/exam_intro_screen.dart';

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

  Widget _buildBody(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: Dimensions.getEdgeInsetsAll(context, 20),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: Dimensions.getEdgeInsets(context, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: Dimensions.getConvertedWidthSize(context, 30),
                        ),
                      ),
                      //High contrast button
                      HighContrastButton(),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 100),
                ),
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
                    fontSize: Dimensions.getTextSize(context, 22),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Email field
                Container(
                  margin: Dimensions.getEdgeInsets(context, top: 25),
                  height: Dimensions.getConvertedHeightSize(context, 75),
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
                Container(
                  height: Dimensions.getConvertedHeightSize(context, 75),
                  child: CustomTextFormField(
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
                              size:
                                  Dimensions.getConvertedWidthSize(context, 25),
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
                              size:
                                  Dimensions.getConvertedWidthSize(context, 25),
                              color: ColorsApp.greenApp,
                            ),
                          ),
                    isRequired: true,
                    onChanged: (String value) {
                      _formData[Keys.LABEL_PASSWORD] = value;
                    },
                  ),
                ),
                //Submit form button
                Padding(
                  padding: Dimensions.getEdgeInsets(context, bottom: 70),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  FailureToMessagesConverter().convert(context, state.failure),
                ),
              ),
            );
          } else if (state is Loaded) {
            Route route = AnimationSlideTransistion(
              widget: VerifyEmailPage(),
            );
            Navigator.push(context, route);
          } else if (state is EmailNotVerifiedState) {
            Route route = AnimationSlideTransistion(
              widget: ExamIntroScreen(),
            );
            Navigator.push(context, route);
          } else if (state is RecoverPasswordState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  Strings(context).recoverPasswordEmailSent,
                ),
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return LoadingWidget(_buildBody(context));
            } else {
              return _buildBody(context);
            }
          },
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

    BlocProvider.of<AuthBloc>(context).add(
      SignInEvent(
        email: _formData[Keys.LABEL_EMAIL],
        password: _formData[Keys.LABEL_PASSWORD],
      ),
    );
  }
}
