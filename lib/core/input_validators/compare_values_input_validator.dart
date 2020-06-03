import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petct/core/input_validators/base_input_validator.dart';

class CompareValuesInputValidator extends BaseInputValidator {
  final String valueToCompare;
  final String errorMessage;

  CompareValuesInputValidator(
      {@required this.valueToCompare, @required this.errorMessage})
      : assert(errorMessage != null);

  @override
  String validate(BuildContext context, String value) {
    if (valueToCompare == null || valueToCompare != value) return errorMessage;

    return null;
  }
}
