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

  // Diet Meals Page
  String firstDayTab;
  String secondDayTab;
  String thirdDayTab;
  String itemTitle;
  String quantityTitle;
  String mealsTitle;
  String shoppingList;
  String shareTitle;
  String downloadTitle;
  String foodListTitle;
  String allowedLabel;
  String forbiddenLabel;
  String forbiddenFoodTitle;
  String allowedFoodTitle;
  String addToDiary;
  String aboutFood;
  String recordedSubtitle;
  String pendingSubtitle;
  String waitingSubtitle;
  String ingredientsTitle;

  //Base Page
  String homeLabel;
  String menuLabel;
  String alertLabel;
  String settingsLabel;

  //Exam Intro Form
  String aboutExam;
  String fillExamDetails;
  String dateTimeExam;
  String hourLabel;
  String examLocation;
  String localLabel;

  //Meals Intro Form
  String selectMealsTime;
  String mealsTimeTitle;
  String breakfastLabel;
  String morningsnackLabel;
  String lunchLabel;
  String afternoonsnackLabel;
  String dinnerLabel;
  String supperLabel;
  String readyLabel;

  //Date Picker App
  String dateLabel;

  //Choose Menu Page
  String optionOne;
  String optionTwo;
  String optionThree;
  String chooseDish;
  String firstDay;
  String secondDay;
  String thirdDay;

  //About Food
  String dietFood;
  String groupTitle;
  String foodReplacementFood;
  String attentionExclamation;
  String maximumQuantity;
  String forbiddenFoodText;
  String protein;
  String oils;
  String cheese;
  String vegetables;
  String liquid;
  String proteinExamples;
  String oilsExamples;
  String cheeseExamples;
  String vegetablesExamples;
  String liquidExamples;

  //About Food
  String noAlert;
  String alertsTitle;
  String registerLabel;
  String okLabel;
  String disableAlerts;
  String areYouSureDisableText;
  String disableLabel;
  String cancelLabel;

  //Register Meal Page
  String anyChangesToMeal;
  String selectIngestedItens;

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
    firstDayTab = intl.Strings.of(context).valueOf("first_day_tab");
    secondDayTab = intl.Strings.of(context).valueOf("second_day_tab");
    thirdDayTab = intl.Strings.of(context).valueOf("third_day_tab");
    itemTitle = intl.Strings.of(context).valueOf("item_title");
    quantityTitle = intl.Strings.of(context).valueOf("quantity_title");
    mealsTitle = intl.Strings.of(context).valueOf("meals_title");
    shoppingList = intl.Strings.of(context).valueOf("shopping_list");
    shareTitle = intl.Strings.of(context).valueOf("share_title");
    downloadTitle = intl.Strings.of(context).valueOf("download_title");
    homeLabel = intl.Strings.of(context).valueOf("home_label");
    menuLabel = intl.Strings.of(context).valueOf("menu_label");
    alertLabel = intl.Strings.of(context).valueOf("alert_label");
    settingsLabel = intl.Strings.of(context).valueOf("settings_label");
    foodListTitle = intl.Strings.of(context).valueOf("food_list_title");
    allowedLabel = intl.Strings.of(context).valueOf("allowed_label");
    forbiddenLabel = intl.Strings.of(context).valueOf("forbidden_label");
    forbiddenFoodTitle =
        intl.Strings.of(context).valueOf("forbidden_food_title");
    allowedFoodTitle = intl.Strings.of(context).valueOf("allowed_food_title");
    addToDiary = intl.Strings.of(context).valueOf("add_to_diary");
    aboutFood = intl.Strings.of(context).valueOf("about_food");
    aboutExam = intl.Strings.of(context).valueOf("about_exam");
    fillExamDetails = intl.Strings.of(context).valueOf("fill_exam_details");
    dateTimeExam = intl.Strings.of(context).valueOf("date_time_exam");
    hourLabel = intl.Strings.of(context).valueOf("hour_label");
    examLocation = intl.Strings.of(context).valueOf("exam_location");
    localLabel = intl.Strings.of(context).valueOf("local_label");
    selectMealsTime = intl.Strings.of(context).valueOf("select_meals_time");
    mealsTimeTitle = intl.Strings.of(context).valueOf("meals_time_title");
    breakfastLabel = intl.Strings.of(context).valueOf("breakfast_label");
    morningsnackLabel = intl.Strings.of(context).valueOf("morningsnack_label");
    lunchLabel = intl.Strings.of(context).valueOf("lunch_label");
    afternoonsnackLabel =
        intl.Strings.of(context).valueOf("afternoonsnack_label");
    dinnerLabel = intl.Strings.of(context).valueOf("dinner_label");
    supperLabel = intl.Strings.of(context).valueOf("supper_label");
    readyLabel = intl.Strings.of(context).valueOf("ready_label");
    dateLabel = intl.Strings.of(context).valueOf("date_label");
    optionOne = intl.Strings.of(context).valueOf("option_one");
    optionTwo = intl.Strings.of(context).valueOf("option_two");
    optionThree = intl.Strings.of(context).valueOf("option_three");
    chooseDish = intl.Strings.of(context).valueOf("choose_dish");
    firstDay = intl.Strings.of(context).valueOf("first_day");
    secondDay = intl.Strings.of(context).valueOf("second_day");
    thirdDay = intl.Strings.of(context).valueOf("third_day");
    dietFood = intl.Strings.of(context).valueOf("diet_food");
    groupTitle = intl.Strings.of(context).valueOf("group_title");
    foodReplacementFood =
        intl.Strings.of(context).valueOf("food_replacement_text");
    attentionExclamation =
        intl.Strings.of(context).valueOf("attention_exclamation");
    maximumQuantity = intl.Strings.of(context).valueOf("maximum_quantity");
    forbiddenFoodText = intl.Strings.of(context).valueOf("forbidden_food_text");
    protein = intl.Strings.of(context).valueOf("protein_title");
    oils = intl.Strings.of(context).valueOf("oils_title");
    cheese = intl.Strings.of(context).valueOf("cheese_title");
    vegetables = intl.Strings.of(context).valueOf("vegetables_title");
    liquid = intl.Strings.of(context).valueOf("liquid_title");
    proteinExamples = intl.Strings.of(context).valueOf("protein_examples");
    oilsExamples = intl.Strings.of(context).valueOf("oils_examples");
    cheeseExamples = intl.Strings.of(context).valueOf("cheese_examples");
    vegetablesExamples =
        intl.Strings.of(context).valueOf("vegetables_examples");
    liquidExamples = intl.Strings.of(context).valueOf("liquid_examples");
    noAlert = intl.Strings.of(context).valueOf("no_alert");
    alertsTitle = intl.Strings.of(context).valueOf("alerts_title");
    registerLabel = intl.Strings.of(context).valueOf("register_label");
    okLabel = intl.Strings.of(context).valueOf("ok_label");
    disableAlerts = intl.Strings.of(context).valueOf("disable_alerts");
    areYouSureDisableText =
        intl.Strings.of(context).valueOf("are_you_sure_disable_text");
    disableLabel = intl.Strings.of(context).valueOf("disable_label");
    cancelLabel = intl.Strings.of(context).valueOf("cancel_label");
    recordedSubtitle = intl.Strings.of(context).valueOf("recorded_subtitle");
    pendingSubtitle = intl.Strings.of(context).valueOf("pending_subtitle");
    waitingSubtitle = intl.Strings.of(context).valueOf("waiting_subtitle");
    ingredientsTitle = intl.Strings.of(context).valueOf("ingredients_title");
    anyChangesToMeal = intl.Strings.of(context).valueOf("any_changes_to_meal");
    selectIngestedItens =
        intl.Strings.of(context).valueOf("select_ingested_itens");
  }
}
