import 'package:petct/features/diet-meals/presentation/models/meal_model.dart';
import 'package:meta/meta.dart';

class MenuDayModel {
  String menuDay;
  List<MealModel> meals;

  MenuDayModel({@required this.menuDay, @required this.meals});
}
