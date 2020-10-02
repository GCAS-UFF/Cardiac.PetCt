import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/meal_type.dart';

import 'meal_item.dart';

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
