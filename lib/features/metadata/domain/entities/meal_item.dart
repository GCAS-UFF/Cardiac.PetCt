import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/food.dart';

import 'food.dart';
import 'measurement_unit.dart';

class MealItem extends Equatable {
  final String id;
  final String name;
  final List<Food> foods;
  final double portion;
  final MeasurementUnit measurementUnit;
  final String imageUrl;

  MealItem(
      {@required this.id,
      @required this.name,
      @required this.foods,
      @required this.portion,
      @required this.measurementUnit,
      @required this.imageUrl});

  @override
  List<Object> get props =>
      [id, name, foods, portion, measurementUnit, imageUrl];
}
