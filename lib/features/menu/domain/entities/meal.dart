import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/diet-meals/presentation/widgets/meal_item.dart';
import 'package:petct/features/menu/domain/entities/meal_type.dart';

class Meal extends Equatable {
  final MealType type;
  final List<MealItem> itens;
  final double price;
  final String currency;
  final String imageName;

  Meal({
    @required this.type,
    @required this.itens,
    @required this.price,
    @required this.currency,
    @required this.imageName,
  });

  @override
  List<Object> get props => [type, itens, price, currency, imageName];
}
