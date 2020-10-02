import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MeasurementUnit extends Equatable {
  final String id;
  final String name;
  final String type;

  MeasurementUnit(
      {@required this.id, @required this.name, @required this.type});

  @override
  List<Object> get props => [id, name, type];
}
