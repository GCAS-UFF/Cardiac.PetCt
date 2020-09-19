import 'package:meta/meta.dart';

class MealItemModel {
  String id;
  String name;
  String image;
  double maximumQuantity;
  FoodGroup group;
  Measurement measurement;

  MealItemModel(this.maximumQuantity,
      {@required this.name,
      @required this.group,
      @required this.image,
      @required this.measurement,});
}

enum FoodGroup { PROTEIN, OILS, CHEESE, VEGETABLES, LIQUID, FORBIDDEN }
enum Measurement { MILLIMETER, UNITY, GRAMS }
