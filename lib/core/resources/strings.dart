import 'package:flutter/widgets.dart';
import 'package:internationalization/internationalization.dart' as intl;

class Strings {
  final BuildContext context;

  // Masks
  static const String dateMask = "xx/xx/xxxx";

  //Input validator
  String dayInputErrorValidation;
  String monthInputErrorValidation;
  String futureDateInputErrorValidation;
  String dateInputErrorValidation;

  // General
  String no;
  String yes;
  String ok;
  String appButtonRegisterTitle;
  String nextOption;
  String backOption;
  String about;
  String attention;
  String send;
  String save;
  String cancel;
  String sorry;
  String dataSaved;
  String dataNotSaved;
  String functionNotAvailable;
  String complete;
  String incomplete;
  String logoName;

  // Start Page
  String startPageParagraph;
  String startPageTitle;
  String registerLabelButton;
  String signinLabelButton;
  String petctDiaryTitle;
  String highContrast;

  //Login Page
  String loginTitle;
  String sigininToApp;
  String emailLabel;
  String passwordLabel;
  String forgotPassword;
  String emptyFieldMessage;
  String recoverPasswordEmailSent;
  static const String email_format_error_message = "Email inválido";

  //Recover Password
  String recoverPasswordTitle;
  String emailSuccessfullySent;

  //Register Page
  String registerTitle;
  String nameLabel;
  String birthLabel;
  String genderLabel;
  String repeatPasswordLabel;
  String passwordsNotEqual;

  //Verify Email Page
  String verifyEmailText;
  String verifyEmailTitle;
  String resendLabel;
  String emailVerifiedLabel;

  // Failure To Message
  String messageServerFailure;
  String messageNoInternetFailure;
  String messageCacheFailure;
  String messageUnknownError;

  Strings(this.context) {
    dateInputErrorValidation =
        intl.Strings.of(context).valueOf("date_input_error_validation");
    dayInputErrorValidation =
        intl.Strings.of(context).valueOf("day_input_error_validation");
    monthInputErrorValidation =
        intl.Strings.of(context).valueOf("month_input_error_validation");
    futureDateInputErrorValidation =
        intl.Strings.of(context).valueOf("future_date_input_error_validation");
    no = intl.Strings.of(context).valueOf("no");
    yes = intl.Strings.of(context).valueOf("yes");
    ok = intl.Strings.of(context).valueOf("ok");
    appButtonRegisterTitle =
        intl.Strings.of(context).valueOf("app_button_register_title");
    nextOption = intl.Strings.of(context).valueOf("next_option");
    backOption = intl.Strings.of(context).valueOf("back_option");
    about = intl.Strings.of(context).valueOf("about");
    attention = intl.Strings.of(context).valueOf("attention");
    send = intl.Strings.of(context).valueOf("send");
    save = intl.Strings.of(context).valueOf("save");
    cancel = intl.Strings.of(context).valueOf("cancel");
    sorry = intl.Strings.of(context).valueOf("sorry");
    dataSaved = intl.Strings.of(context).valueOf("data_saved");
    dataNotSaved = intl.Strings.of(context).valueOf("data_not_saved");
    functionNotAvailable =
        intl.Strings.of(context).valueOf("function_not_available");
    complete = intl.Strings.of(context).valueOf("complete");
    incomplete = intl.Strings.of(context).valueOf("incomplete");
    startPageParagraph =
        intl.Strings.of(context).valueOf("start_page_paragraph");
    startPageTitle = intl.Strings.of(context).valueOf("start_page_title");
    registerLabelButton =
        intl.Strings.of(context).valueOf("register_label_button");
    signinLabelButton = intl.Strings.of(context).valueOf("signin_label_button");
    petctDiaryTitle = intl.Strings.of(context).valueOf("petct_diary_title");
    sigininToApp = intl.Strings.of(context).valueOf("signin_to_app");
    emailLabel = intl.Strings.of(context).valueOf("email_label");
    passwordLabel = intl.Strings.of(context).valueOf("password_label");
    forgotPassword = intl.Strings.of(context).valueOf("forgot_password");
    emptyFieldMessage = intl.Strings.of(context).valueOf("empty_field_message");
    registerTitle = intl.Strings.of(context).valueOf("register_title");
    nameLabel = intl.Strings.of(context).valueOf("name_label");
    birthLabel = intl.Strings.of(context).valueOf("birth_label");
    genderLabel = intl.Strings.of(context).valueOf("gender_label");
    repeatPasswordLabel =
        intl.Strings.of(context).valueOf("repeat_password_label");
    passwordsNotEqual = intl.Strings.of(context).valueOf("passwords_not_equal");
    verifyEmailText = intl.Strings.of(context).valueOf("verify_email_text");
    verifyEmailTitle = intl.Strings.of(context).valueOf("verify_email_title");
    resendLabel = intl.Strings.of(context).valueOf("resend_label");
    emailVerifiedLabel =
        intl.Strings.of(context).valueOf("email_verified_label");
    loginTitle = intl.Strings.of(context).valueOf("login_title");
    recoverPasswordTitle =
        intl.Strings.of(context).valueOf("recover_password_title");
    messageServerFailure =
        intl.Strings.of(context).valueOf("message_server_failure");
    messageNoInternetFailure =
        intl.Strings.of(context).valueOf("message_no_internet_failure");
    messageCacheFailure =
        intl.Strings.of(context).valueOf("message_cache_failure");
    messageUnknownError =
        intl.Strings.of(context).valueOf("message_unknown_error");
    recoverPasswordEmailSent =
        intl.Strings.of(context).valueOf("recover_password_email_sent");
    highContrast = intl.Strings.of(context).valueOf("high_contrast");
    emailSuccessfullySent =
        intl.Strings.of(context).valueOf("email_successfully_sent");
    logoName = intl.Strings.of(context).valueOf("logo_name");
  }
}
