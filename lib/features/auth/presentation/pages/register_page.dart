import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petct/core/input_validators/compare_values_input_validator.dart';
import 'package:petct/core/input_validators/date_input_validator.dart';
import 'package:petct/core/input_validators/email_input_validator.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/images.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_dropdown.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';
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
  TextEditingController _genderController;
  TextEditingController _passwordController;
  TextEditingController _repeatPasswordController;
  List<DropdownMenuItem<String>> _list;

  @override
  void initState() {
    _emailController = TextEditingController(text: _formData[Keys.LABEL_EMAIL]);
    _passwordController =
        TextEditingController(text: _formData[Keys.LABEL_PASSWORD]);
    _nameController = TextEditingController(text: _formData[Keys.LABEL_NAME]);
    _genderController =
        TextEditingController(text: _formData[Keys.LABEL_GENDER]);
    _repeatPasswordController =
        TextEditingController(text: _formData[Keys.LABEL_REPEATPASSWORD]);
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    _list = [
      DropdownMenuItem(
        value: 'female',
        child: Container(
          child: Text(
            "Feminino",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
              color: Colors.black,
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'male',
        child: Container(
          child: Text(
            "Masculino",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
              color: Colors.black,
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'transPerson',
        child: Container(
          child: Text(
            "Pessoa trans",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
              color: Colors.black,
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'transMan',
        child: Container(
          child: Text(
            "Homem trans",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
              color: Colors.black,
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 'transWoman',
        child: Container(
          child: Text(
            "Mulher trans",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
              color: Colors.black,
            ),
          ),
        ),
      ),
    ];

    return Container(
      color: Colors.white,
      height: double.infinity,
      padding: Dimensions.getEdgeInsets(context, left: 20, right: 20),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          //Start animation
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Register title
              Text(
                Strings(context).registerTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.getTextSize(context, 22),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              //Name textfield
              CustomTextFormField(
                text: Strings(context).nameLabel,
                textEditingController: _nameController,
                isRequired: true,
                onChanged: (String value) {
                  _formData[Keys.LABEL_NAME] = value;
                },
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              //Birth textfield
              CustomTextFormField(
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
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              //Gender dropdown
              CustomDropdown(
                value: _formData[Keys.LABEL_GENDER],
                hint: Text(
                  Strings(context).genderLabel,
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(context, 14),
                    color: Colors.black,
                  ),
                ),
                options: _list,
                onChange: (String value) {
                  setState(() {
                    _formData[Keys.LABEL_GENDER] = value;
                  });
                },
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              //Email textfield
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
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              //Password textfield
              CustomTextFormField(
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
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 20),
              ),
              //Repeat password textfield
              CustomTextFormField(
                text: Strings(context).repeatPasswordLabel,
                textEditingController: _repeatPasswordController,
                obscureText: true,
                isRequired: true,
                // TO DO refactor error message
                validator: CompareValuesInputValidator(
                    valueToCompare: _formData[Keys.LABEL_PASSWORD],
                    errorMessage: "Giovane ajeita aqui"),
                onChanged: (String value) {
                  _formData[Keys.LABEL_REPEATPASSWORD] = value;
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: InkWell(
          //Back to start page button
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: Dimensions.getEdgeInsets(context, top: 20, left: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: Dimensions.getConvertedWidthSize(context, 30),
                ),
                SizedBox(
                  width: Dimensions.getConvertedWidthSize(context, 80),
                ),
                // Logo image
                Image(
                  image: AssetImage(Images.name_app),
                  width: Dimensions.getConvertedWidthSize(context, 140),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
        if (state is Error) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                FailureToMessagesConverter().convert(context, state.failure),
              ),
            ),
          );
        } else if (state is Registred) {
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
