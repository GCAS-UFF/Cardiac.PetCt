import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MealTimes extends Equatable {
  TimeOfDay breakfast;
  TimeOfDay morningSnack;
  TimeOfDay lunch;
  TimeOfDay afternoonSnack;
  TimeOfDay dinner;
  TimeOfDay supper;

  MealTimes(
      {@required this.breakfast,
      @required this.morningSnack,
      @required this.lunch,
      @required this.afternoonSnack,
      @required this.dinner,
      @required this.supper});

  @override
  List<Object> get props => [
        breakfast,
        morningSnack,
        lunch,
        afternoonSnack,
        dinner,
        supper,
      ];
}

enum MealEnum {
  Breakfast,
  MorningSnack,
  Lunch,
  AfternoonSnack,
  Dinner,
  Supper,
}
