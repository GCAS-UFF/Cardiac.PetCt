import 'dart:io';

import 'package:petct/features/diet-meals/presentation/models/classification.dart';
import 'package:meta/meta.dart';

class Food {
  String name;
  ClassificationType classificationType;
  String imagePath;

  Food(
      {@required this.name, @required this.classificationType, this.imagePath});
}
