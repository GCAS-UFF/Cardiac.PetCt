import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/menu/domain/entities/foood.dart';
import 'package:petct/features/menu/domain/entities/measurement_unit.dart';

class MealItem extends Equatable {
  final String name;
  final List<Food> foods;
  final int portion;
  final MeasuramentUnit unit;
  final String imageName;

  MealItem({
    @required this.name,
    @required this.foods,
    @required this.portion,
    @required this.unit,
    @required this.imageName,
  });

  @override
  List<Object> get props => [name, foods, portion, unit, imageName];
}
