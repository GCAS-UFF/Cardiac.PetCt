import 'package:petct/features/diet-meals/presentation/models/day.dart';

class Configuration {
  DateTime examDate;
  String examLocal;
  List<DateTime> mealsTime;
  List<Day> daysList;
  Configuration({
    this.examDate,
    this.examLocal,
    this.mealsTime,
    this.daysList,
  });
}
