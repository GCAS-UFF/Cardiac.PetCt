import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:petct/core/resources/strings.dart';
import 'base_input_validator.dart';

class DateInputValidator extends BaseInputValidator {
  @override
  String validate(BuildContext context, String value) {
    if (value != null && value.isNotEmpty) {
      if (value.length != 10) return Strings(context).dateInputErrorValidation;

      int day = int.tryParse(value.substring(0, 2));
      int month = int.tryParse(value.substring(3, 5));
      int year = int.tryParse(value.substring(6, 10));

      bool futureDate = true;
      if ((DateTime.now().year - year) > 0)
        futureDate = false;
      else if ((DateTime.now().year - year) == 0) {
        if (DateTime.now().month - month > 0) {
          futureDate = false;
        } else if (DateTime.now().month - month == 0) {
          if (DateTime.now().day - day >= 0) {
            futureDate = false;
          }
        }
      }
      debugPrint(futureDate.toString());

      if (day == null || day < 0 || day > 31)
        return Strings(context).dayInputErrorValidation;
      if (month == null || month < 0 || month > 12)
        return Strings(context).monthInputErrorValidation;
      if (futureDate) return Strings(context).futureDateInputErrorValidation;
    }

    return null;
  }
}