import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petct/core/input_validators/compare_values_input_validator.dart';
import 'package:petct/core/input_validators/date_input_validator.dart';
import 'package:petct/core/input_validators/email_input_validator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_dropdown.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';
import 'package:petct/core/ui/high_contrast_button.dart';
import 'package:petct/core/ui/loading_widget.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/core/utils/date_helper.dart';
import 'package:petct/core/utils/failure_to_message_converter.dart';
import 'package:petct/core/utils/multimasked_text_controller.dart';
import 'package:petct/features/auth/domain/entities/user.dart';
import 'package:petct/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petct/features/auth/presentation/pages/verify_email_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _birthController = MultimaskedTextController(
    maskDefault: Strings.dateMask,
    onlyDigitsDefault: true,
  ).maskedTextFieldController;
  TextEditingController _passwordController;
  TextEditingController _repeatPasswordController;
  List<DropdownMenuItem<String>> _list;

  @override
  void initState() {
    _emailController = TextEditingController(text: _formData[Keys.LABEL_EMAIL]);
    _passwordController =
        TextEditingController(text: _formData[Keys.LABEL_PASSWORD]);
    _nameController = TextEditingController(text: _formData[Keys.LABEL_NAME]);
    _repeatPasswordController =
        TextEditingController(text: _formData[Keys.LABEL_REPEATPASSWORD]);
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    _list = [
      DropdownMenuItem(
        value: 'female',
        child: Text(
          "Feminino",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'male',
        child: Text(
          "Masculino",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'transPerson',
        child: Text(
          "Pessoa trans",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'transMan',
        child: Text(
          "Homem trans",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'transWoman',
        child: Text(
          "Mulher trans",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: Dimensions.getTextSize(context, 16),
          ),
        ),
      ),
    ];

    return Container(
      height: double.infinity,
      padding: Dimensions.getEdgeInsetsFromLTRB(context, 20, 20, 20, 0),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            //Start animation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: Dimensions.getEdgeInsets(context, top: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        //Back to start page button
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
                  height: Dimensions.getConvertedHeightSize(context, 50),
                ),
                //Register title
                Text(
                  Strings(context).registerTitle,
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 22),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 20),
                ),
                //Name textfield
                Container(
                  height: Dimensions.getConvertedHeightSize(context, 86),
                  child: CustomTextFormField(
                    text: Strings(context).nameLabel,
                    textEditingController: _nameController,
                    isRequired: true,
                    onChanged: (String value) {
                      _formData[Keys.LABEL_NAME] = value;
                    },
                  ),
                ),
                //Birth textfield
                Container(
                  height: Dimensions.getConvertedHeightSize(context, 86),
                  child: CustomTextFormField(
                    text: Strings(context).birthLabel,
                    validator: DateInputValidator(),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    textEditingController: _birthController,
                    isRequired: true,
                    onChanged: (String value) {
                      _formData[Keys.LABEL_BIRTH] = value;
                    },
                  ),
                ),
                //Gender dropdown
                Container(
                  height: Dimensions.getConvertedHeightSize(context, 86),
                  child: CustomDropdown(
                    value: _formData[Keys.LABEL_GENDER],
                    hint: Text(
                      Strings(context).genderLabel,
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 16),
                        color: ColorsApp.greenApp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    options: _list,
                    onChange: (String value) {
                      setState(() {
                        _formData[Keys.LABEL_GENDER] = value;
                      });
                    },
                  ),
                ),
                //Email textfield
                Container(
                  height: Dimensions.getConvertedHeightSize(context, 86),
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
                //Password textfield
                Container(
                  height: Dimensions.getConvertedHeightSize(context, 86),
                  child: CustomTextFormField(
                    text: Strings(context).passwordLabel,
                    obscureText: true,
                    textEditingController: _passwordController,
                    isRequired: true,
                    onChanged: (String value) {
                      setState(() {
                        _formData[Keys.LABEL_PASSWORD] = value;
                      });
                    },
                  ),
                ),
                //Repeat password textfield
                Container(
                  height: Dimensions.getConvertedHeightSize(context, 86),
                  child: CustomTextFormField(
                    text: Strings(context).repeatPasswordLabel,
                    textEditingController: _repeatPasswordController,
                    obscureText: true,
                    isRequired: true,
                    validator: CompareValuesInputValidator(
                      valueToCompare: _formData[Keys.LABEL_PASSWORD],
                      errorMessage: Strings(context).passwordsNotEqual,
                    ),
                    onChanged: (String value) {
                      _formData[Keys.LABEL_REPEATPASSWORD] = value;
                    },
                  ),
                ),
                ButtonApp(
                    title: Strings(context).registerLabelButton,
                    onPressed: () {
                      _submitFormLogin(context);
                    },
                    type: ButtonType.BUTTON_GREEN),
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
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
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
        }
      }, child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            return LoadingWidget(_buildBody(context));
          } else {
            return _buildBody(context);
          }
        },
      )),
    );
  }

  void _submitFormLogin(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    BlocProvider.of<AuthBloc>(context).add(
      SignUpEvent(
        user: User(
            name: _formData[Keys.LABEL_NAME],
            email: _formData[Keys.LABEL_EMAIL],
            gender: _formData[Keys.LABEL_GENDER],
            birthDate:
                DateHelper.convertStringToDate(_formData[Keys.LABEL_BIRTH])),
        password: _formData[Keys.LABEL_PASSWORD],
      ),
    );
  }
}
