import 'package:meta/meta.dart';

class ProgressItem {
  String title;
  String text;
  ProgressStep step;
  DateTime progressUpdateTime;

  ProgressItem(
      {@required this.title,
      @required this.text,
      @required this.step,
      @required this.progressUpdateTime});
}

enum ProgressStep { WaitingDiet, Diet, Fasting, Exam }
