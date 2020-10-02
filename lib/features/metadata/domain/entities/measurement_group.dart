import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'measurement_unit.dart';

class MeasurementGroup extends Equatable {
  final double portion;
  final MeasurementUnit measurementUnit;

  MeasurementGroup({@required this.portion, @required this.measurementUnit});

  @override
  List<Object> get props => [portion, measurementUnit];
}
