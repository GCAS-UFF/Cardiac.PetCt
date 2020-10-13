import 'package:meta/meta.dart';

class ProgressItem {
  String title;
  String text;
  ProgressStatus status;
  ProgressStep step;

  ProgressItem(
      {@required this.title,
      @required this.text,
      @required this.status,
      @required this.step});
}

enum ProgressStatus { Done, Current, Future }

enum ProgressStep { WaitingDiet, Diet, Fasting, Exam }
