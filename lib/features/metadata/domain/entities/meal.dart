import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_item.dart';

import 'meal_type.dart';

class Meal extends Equatable {
  final String id;
  final MealType type;
  final List<MealItem> items;
  final double totalPrice;
  final String currency;
  final String imageUrl;

  Meal(
      {@required this.id,
      @required this.type,
      @required this.items,
      @required this.totalPrice,
      @required this.currency,
      @required this.imageUrl});

  @override
  List<Object> get props => [id, type, items, totalPrice, currency, imageUrl];
}
