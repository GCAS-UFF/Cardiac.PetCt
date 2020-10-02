import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/food.dart';

import 'food.dart';
import 'measurement_group.dart';

class MealItem extends Equatable {
  final String id;
  final String name;
  final List<Food> foods;
  final List<MeasurementGroup> measurements;
  final String imageUrl;

  MealItem(
      {@required this.id,
      @required this.name,
      @required this.foods,
      @required this.measurements,
      @required this.imageUrl});

  @override
  List<Object> get props => [id, name, foods, measurements, imageUrl];
}
