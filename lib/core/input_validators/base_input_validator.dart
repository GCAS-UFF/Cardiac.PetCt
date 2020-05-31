import 'package:flutter/widgets.dart';

abstract class BaseInputValidator {
  String validate(BuildContext context, String value);
}