import 'package:flutter/material.dart';

class AlertModel {
  String name;
  String discription;
  AlertType type;
  String time;

  AlertModel(
      {@required this.name,
      @required this.type,
      @required this.time,
      @required this.discription});
}

enum AlertType { MEALTIME, PROGRESSCHANGE, REMINDER }
