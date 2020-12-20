import 'package:meta/meta.dart';

class ProgressItem {
  String title;
  String text;
  ProgressStep step;

  ProgressItem(
      {@required this.title,
      @required this.text,
      @required this.step});
}

enum ProgressStep { WaitingDiet, Diet, Fasting, Exam }
