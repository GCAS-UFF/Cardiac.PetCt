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
  String shoppingListPdfTitle;
  String shoppingListPdfEggAndMeat;
  String shoppingListPdfVegetables;
  String shoppingListPdfOils;
  String shoppingListPdfOilSeeds;
  String shoppingListPdfLiquids;
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

  //Progress page
  String progressPageTitle;
  String progressPageCardTitlePrepare;
  String progressPageCardTitleDiet;
  String progressPageCardTitleFasting;
  String progressPageCardTitleDone;
  String progressPageCardTextPrepare;
  String progressPageCardTextDiet;
  String progressPageCardTextFasting;
  String progressPageCardTextDone;
  String progressPageDaysLeft;
  String progressPageStart;
  String progressPageDiet;
  String progressPageFinish;
  String progressPageHoursLeft;
  String progressPageFasting;
  String progressPageDoExam;
  String progressPageCongratulations;
  String progressPageSeeDiet;
  String progressPageGenerateDietHistory;

  //Anamnesis socioeconomic start page
  String anamnesisSocieconomicLabelButton;
  String anamnesisSocieconomicText;

  //Anamnesis socioeconomic finish page
  String anamnesisSocieconomicFinishLabelButton;
  String anamnesisSocieconomicFinishText;
  String anamnesisSocioeconomicNextLabelButton;
  String anamnesisSocioeconomicBackLabelButton;
  String anamnesisSocioeconomicPhysicalShapeTitle;
  String anamnesisSocioeconomicWeightHint;
  String anamnesisSocioeconomicHeightHint;
  String anamnesisSocioeconomicSexQuestion;
  String anamnesisSocioeconomicSexFemaleOption;
  String anamnesisSocioeconomicSexMaleOption;
  String anamnesisSocioeconomicHabitsTitle;
  String anamnesisSocioeconomicHabitsNeverOption;
  String anamnesisSocioeconomicHabitsEventuallyOption;
  String anamnesisSocioeconomicHabitsOftenOption;
  String anamnesisSocioeconomicIsSmokerQuestion;
  String anamnesisSocioeconomicHabitsIsSmokerOption;
  String anamnesisSocioeconomicHabitsStoppedSmokingOption;
  String anamnesisSocioeconomicHabitsNeverSmokedOption;
  String anamnesisSocioeconomicHabitsYearsSmokingTitle;
  String anamnesisSocioeconomicHabitsYearsSmokingHint;
  String anamnesisSocioeconomicHabitsDailyCigarretesTitle;
  String anamnesisSocioeconomicHabitsDailyCigarretesHint;
  String anamnesisSocioeconomicDrinksQuestion;
  String anamnesisSocioeconomicHabitsDrinkBeerOption;
  String anamnesisSocioeconomicHabitsDrinkWineOption;
  String anamnesisSocioeconomicHabitsDrinkCachacaOption;
  String anamnesisSocioeconomicHabitsDrinkVodkaWhiskyOption;
  String anamnesisSocioeconomicHabitsTypeOfDrinkQuestion;
  String anamnesisSocioeconomicHabitsDrinkQuantityQuestion;
  String anamnesisSocioeconomicHabits1GlassDrinkOption;
  String anamnesisSocioeconomicHabits1CanDrinkOption;
  String anamnesisSocioeconomicHabits1DoseDrinkOption;
  String anamnesisSocioeconomicHabits1to3GlassDrinkOption;
  String anamnesisSocioeconomicHabits1to3CanDrinkOption;
  String anamnesisSocioeconomicHabits1to3DoseDrinkOption;
  String anamnesisSocioeconomicHabitsMoreThan3GlassDrinkOption;
  String anamnesisSocioeconomicHabitsMoreThan3CanDrinkOption;
  String anamnesisSocioeconomicHabitsMoreThan3DoseDrinkOption;
  String anamnesisSocioeconomicPhysicalActivityFrequencyQuestion;
  String anamnesisSocioeconomicPhysicalActivitiesFrequency1to2Option;
  String anamnesisSocioeconomicPhysicalActivitiesFrequency3to4Option;
  String anamnesisSocioeconomicPhysicalActivitiesFrequency5to6Option;
  String anamnesisSocioeconomicPhysicalActititiesFrequency7Option;
  String anamnesisSocioeconomicWeightQuestion;
  String anamnesisSocioeconomicHeightQuestion;
  String anamnesisSocioeconomicPhysicalActivityTitle;
  String anamnesisSocioeconomicPhysicalActivityQuestion;
  String anamnesisSocioeconomicPhysicalActivityWichQuestion;
  String anamnesisSocioeconomicWichActivityHint;
  String anamnesisSocioeconomicComorbiditiesQuestion;
  String anamnesisSocioeconomicComorbiditiesHypertensionOption;
  String anamnesisSocioeconomicComorbiditiesDiabetesOption;
  String anamnesisSocioeconomicComorbiditiesRenalChronicDiseaseOption;
  String
      anamnesisSocioeconomicComorbiditiesPulmonaryChronicObstructiveDiseaseOption;
  String anamnesisSocioeconomicComorbiditiesAsthmaOption;
  String anamnesisSocioeconomicComorbiditiesCancerOption;
  String anamnesisSocioeconomicComorbiditiesHighCholesterolTriglyceridesOption;
  String anamnesisSocioeconomicComorbiditiesCerebroVascularAccidentOption;
  String anamnesisSocioeconomicComorbiditiesNotListedOption;
  String anamnesisSocioeconomicComorbiditiesNoneOption;
  String anamnesisSocioeconomicPersonalDataTitle;
  String anamnesisSocioeconomicIncomeQuestion;
  String anamnesisSocioeconomicLessThanOne;
  String anamnesisSocioeconomicBetweenOneAndTwo;
  String anamnesisSocioeconomicBetweenThreeAndFive;
  String anamnesisSocioeconomicMoreThanFive;
  String anamnesisSocioeconomicDegreeQuestion;
  String anamnesisSocioeconomicSelectDegreeHint;
  String anamnesisSocioeconomicLocationAndIndicationTitle;
  String anamnesisSocioeconomicUfAndStateQuestion;
  String anamnesisSocioeconomicUfHint;
  String anamnesisSocioeconomicCityHint;
  String anamnesisSocioeconomicIndicationQuestion;

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
    shoppingListPdfTitle =
        intl.Strings.of(context).valueOf("shopping_list_pdf_title");
    shoppingListPdfTitle =
        intl.Strings.of(context).valueOf("shopping_list_pdf_title");
    shoppingListPdfEggAndMeat =
        intl.Strings.of(context).valueOf("shopping_list_pdf_egg_and_meat");
    shoppingListPdfVegetables =
        intl.Strings.of(context).valueOf("shopping_list_pdf_vegetables");
    shoppingListPdfOils =
        intl.Strings.of(context).valueOf("shopping_list_pdf_oils");
    shoppingListPdfOilSeeds =
        intl.Strings.of(context).valueOf("shopping_list_pdf_oilseeds");
    shoppingListPdfLiquids =
        intl.Strings.of(context).valueOf("shopping_list_pdf_liquids");
    progressPageCardTitlePrepare =
        intl.Strings.of(context).valueOf("progress_page_card_title_prepare");
    progressPageCardTitleDiet =
        intl.Strings.of(context).valueOf("progress_page_card_title_diet");
    progressPageCardTitleFasting =
        intl.Strings.of(context).valueOf("progress_page_card_title_fasting");
    progressPageCardTitleDone =
        intl.Strings.of(context).valueOf("progress_page_card_title_done");
    progressPageCardTextPrepare =
        intl.Strings.of(context).valueOf("progress_page_card_text_prepare");
    progressPageCardTextDiet =
        intl.Strings.of(context).valueOf("progress_page_card_text_diet");
    progressPageCardTextFasting =
        intl.Strings.of(context).valueOf("progress_page_card_text_fasting");
    progressPageCardTextDone =
        intl.Strings.of(context).valueOf("progress_page_card_text_done");
    progressPageTitle =
        intl.Strings.of(context).valueOf("progresso_page_title");
    progressPageDaysLeft =
        intl.Strings.of(context).valueOf("progress_page_days_left");
    progressPageStart = intl.Strings.of(context).valueOf("progress_page_start");
    progressPageDiet = intl.Strings.of(context).valueOf("progress_page_diet");
    progressPageFinish =
        intl.Strings.of(context).valueOf("progress_page_finish");
    progressPageHoursLeft =
        intl.Strings.of(context).valueOf("progress_page_hours_left");
    progressPageFasting =
        intl.Strings.of(context).valueOf("progress_page_fasting");
    progressPageDoExam =
        intl.Strings.of(context).valueOf("progress_page_do_exam");
    progressPageCongratulations =
        intl.Strings.of(context).valueOf("progress_page_congratulations");
    progressPageSeeDiet =
        intl.Strings.of(context).valueOf("progress_page_see_diet");
    progressPageGenerateDietHistory =
        intl.Strings.of(context).valueOf("progress_page_generate_diet_history");
    anamnesisSocieconomicLabelButton = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_start_label_button");
    anamnesisSocieconomicText =
        intl.Strings.of(context).valueOf("anamnesis_socioeconomic_start_text");
    anamnesisSocieconomicFinishLabelButton = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_finish_label_button");
    anamnesisSocieconomicFinishText =
        intl.Strings.of(context).valueOf("anamnesis_socioeconomic_finish_text");
    anamnesisSocioeconomicNextLabelButton = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_next_label_button");
    anamnesisSocioeconomicBackLabelButton =
        intl.Strings.of(context).valueOf("anamnesis_socioeconomic_back_text");
    anamnesisSocioeconomicPhysicalShapeTitle = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_physical_shape_title");
    anamnesisSocioeconomicWeightHint =
        intl.Strings.of(context).valueOf("anamnesis_socioeconomic_weight_hint");
    anamnesisSocioeconomicHeightHint =
        intl.Strings.of(context).valueOf("anamnesis_socioeconomic_height_hint");
    anamnesisSocioeconomicWeightQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_weight_question");
    anamnesisSocioeconomicHeightQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_height_question");
    anamnesisSocioeconomicSexQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_sex_question");
    anamnesisSocioeconomicSexFemaleOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_sex_female_option");
    anamnesisSocioeconomicSexMaleOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_sex_male_option");
    anamnesisSocioeconomicHabitsTitle = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_title");
    anamnesisSocioeconomicHabitsNeverOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_never_option");
    anamnesisSocioeconomicHabitsEventuallyOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_eventually_option");
    anamnesisSocioeconomicHabitsOftenOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_often_option");
    anamnesisSocioeconomicIsSmokerQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_is_smoker_question");
    anamnesisSocioeconomicHabitsIsSmokerOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_is_smoker_option");
    anamnesisSocioeconomicHabitsStoppedSmokingOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_stopped_smoking_option");
    anamnesisSocioeconomicHabitsNeverSmokedOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_never_smoked_option");
    anamnesisSocioeconomicHabitsYearsSmokingTitle = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_years_smoking_title");
    anamnesisSocioeconomicHabitsYearsSmokingHint = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_years_smoking_hint");
    anamnesisSocioeconomicHabitsDailyCigarretesTitle = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_daily_cigarretes_title");
    anamnesisSocioeconomicHabitsDailyCigarretesHint = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_daily_cigarretes_hint");
    anamnesisSocioeconomicDrinksQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_drinks_question");
    anamnesisSocioeconomicHabitsDrinkBeerOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_drink_beer_option");
    anamnesisSocioeconomicHabitsDrinkWineOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_drink_wine_option");
    anamnesisSocioeconomicHabitsDrinkCachacaOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_drink_cachaca_option");
    anamnesisSocioeconomicHabitsDrinkVodkaWhiskyOption =
        intl.Strings.of(context)
            .valueOf("anamnesis_socioeconomic_habits_drink_vodkawhisky_option");
    anamnesisSocioeconomicHabitsTypeOfDrinkQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_type_of_drink_question");
    anamnesisSocioeconomicHabitsDrinkQuantityQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_drink_quantity_question");
    anamnesisSocioeconomicHabits1GlassDrinkOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_1_glass_drink_option");
    anamnesisSocioeconomicHabits1CanDrinkOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_1_can_drink_option");
    anamnesisSocioeconomicHabits1DoseDrinkOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_1_dose_drink_option");
    anamnesisSocioeconomicHabits1to3GlassDrinkOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_1to3_glasses_drink_option");
    anamnesisSocioeconomicHabits1to3CanDrinkOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_1to3_cans_drink_option");
    anamnesisSocioeconomicHabits1to3DoseDrinkOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_habits_1to3_doses_drink_option");
    anamnesisSocioeconomicHabitsMoreThan3GlassDrinkOption =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_habits_morethan3_glasses_drink_option");
    anamnesisSocioeconomicHabitsMoreThan3CanDrinkOption =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_habits_morethan3_cans_drink_option");
    anamnesisSocioeconomicHabitsMoreThan3DoseDrinkOption =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_habits_morethan3_doses_drink_option");
    anamnesisSocioeconomicPhysicalActivityTitle = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_physical_activity_title");
    anamnesisSocioeconomicPhysicalActivityQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_physical_activity_question");
    anamnesisSocioeconomicPhysicalActivityFrequencyQuestion =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_physical_activity_frequency_question");
    anamnesisSocioeconomicPhysicalActivitiesFrequency1to2Option =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_physical_activities_frequency_1to2_option");
    anamnesisSocioeconomicPhysicalActivitiesFrequency3to4Option =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_physical_activities_frequency_3to4_option");
    anamnesisSocioeconomicPhysicalActivitiesFrequency5to6Option =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_physical_activities_frequency_5to6_option");
    anamnesisSocioeconomicPhysicalActititiesFrequency7Option =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_physical_activities_frequency_7_option");
    anamnesisSocioeconomicComorbiditiesQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_comorbidities_question");
    anamnesisSocioeconomicComorbiditiesHypertensionOption =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_comorbidities_hypertension_option");
    anamnesisSocioeconomicComorbiditiesDiabetesOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_comorbidities_diabetes_option");
    anamnesisSocioeconomicComorbiditiesRenalChronicDiseaseOption =
        intl.Strings.of(context)
            .valueOf("anamnesis_socioeconomic_comorbidities_rnc_option");
    anamnesisSocioeconomicComorbiditiesPulmonaryChronicObstructiveDiseaseOption =
        intl.Strings.of(context)
            .valueOf("anamnesis_socioeconomic_comorbidities_pcod_option");
    anamnesisSocioeconomicComorbiditiesAsthmaOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_comorbidities_asthma_option");
    anamnesisSocioeconomicComorbiditiesCancerOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_comorbidities_cancer_option");
    anamnesisSocioeconomicComorbiditiesHighCholesterolTriglyceridesOption =
        intl.Strings.of(context).valueOf(
            "anamnesis_socioeconomic_comorbidities_highcholesteroltriglycerides_option");
    anamnesisSocioeconomicComorbiditiesCerebroVascularAccidentOption =
        intl.Strings.of(context)
            .valueOf("anamnesis_socioeconomic_comorbidities_cva_option");
    anamnesisSocioeconomicComorbiditiesNotListedOption =
        intl.Strings.of(context)
            .valueOf("anamnesis_socioeconomic_comorbidities_notlisted_option");
    anamnesisSocioeconomicComorbiditiesNoneOption = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_comorbidities_none_option");
    anamnesisSocioeconomicWichActivityHint = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_wich_activity_hint");
    anamnesisSocioeconomicPersonalDataTitle = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_personal_data_title");
    anamnesisSocioeconomicIncomeQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_income_question");
    anamnesisSocioeconomicLessThanOne = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_less_than_one");
    anamnesisSocioeconomicBetweenOneAndTwo = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_between_one_and_two");
    anamnesisSocioeconomicBetweenThreeAndFive = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_between_three_and_five");
    anamnesisSocioeconomicMoreThanFive = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_more_than_five");
    anamnesisSocioeconomicDegreeQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_degree_question");
    anamnesisSocioeconomicSelectDegreeHint = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_select_degree_hint");
    anamnesisSocioeconomicLocationAndIndicationTitle = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_location_and_indication_title");
    anamnesisSocioeconomicUfAndStateQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_uf_and_state_question");
    anamnesisSocioeconomicUfHint =
        intl.Strings.of(context).valueOf("anamnesis_socioeconomic_uf_hint");
    anamnesisSocioeconomicCityHint =
        intl.Strings.of(context).valueOf("anamnesis_socioeconomic_city_hint");
    anamnesisSocioeconomicIndicationQuestion = intl.Strings.of(context)
        .valueOf("anamnesis_socioeconomic_indication_question");
  }
}
