import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/keys.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/ui/custom_text_form_field.dart';
import 'package:petct/features/diet-meals/presentation/models/user_meal.dart';
import 'package:petct/features/diet-meals/presentation/widgets/select_meal_item_quantity_widget.dart';

class RegisterMealWidget extends StatefulWidget {
  final UserMeal userMeal;

  const RegisterMealWidget({Key key, this.userMeal}) : super(key: key);
  @override
  _RegisterMealWidgetState createState() => _RegisterMealWidgetState();
}

class _RegisterMealWidgetState extends State<RegisterMealWidget> {
  final Map<String, dynamic> _formData = Map<String, dynamic>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _mealComments;

  @override
  void initState() {
    _mealComments = TextEditingController(text: _formData[Keys.MEAL_COMMENTS]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                Strings(context).selectIngestedItens,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 18),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.getConvertedHeightSize(context, 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Meal itens title
            Text(
              Strings(context).itemTitle,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 12),
                fontWeight: FontWeight.bold,
              ),
            ),
            //Meal quantity title
            Text(
              Strings(context).quantityTitle,
              style: GoogleFonts.montserrat(
                fontSize: Dimensions.getTextSize(context, 12),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: widget.userMeal.mealItems.map((item) {
            return SelectUserMealItemQuantityWidget(
              mealItem: item,
            );
          }).toList(),
        ),
        SizedBox(
          height: Dimensions.getConvertedHeightSize(context, 20),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                Strings(context).anyChangesToMeal,
                style: GoogleFonts.montserrat(
                  fontSize: Dimensions.getTextSize(context, 16),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.getConvertedHeightSize(context, 20),
        ),
        Form(
          key: _formKey,
          child: CustomTextFormField(
            textEditingController: _mealComments,
            onChanged: (String value) {
              _formData[Keys.MEAL_COMMENTS] = value;
            },
          ),
        ),
        SizedBox(
          height: Dimensions.getConvertedHeightSize(context, 20),
        ),
        ButtonApp(
          title: Strings(context).addToDiary,
          onPressed: () {
            Navigator.pop(context);
          },
          type: ButtonType.BUTTON_GREEN,
        ),
        SizedBox(
          height: Dimensions.getConvertedHeightSize(context, 5),
        ),
        ButtonApp(
          title: Strings(context).cancel,
          onPressed: () {
            Navigator.pop(context);
          },
          type: ButtonType.BUTTON_ROUNDED,
        ),
      ],
    );
  }
}
