import 'package:meta/meta.dart';

class Classification {
  String name;
  ClassificationType type;

  Classification({@required this.name, @required this.type});
}

enum ClassificationType { PROTEIN, OILS, CHEESE, VEGETABLES, LIQUID, FORBIDDEN }
