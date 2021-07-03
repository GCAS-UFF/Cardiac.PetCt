import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MeasuramentUnit extends Equatable {
  final String name;
  final String type;

  MeasuramentUnit({@required this.name, @required this.type});

  @override
  List<Object> get props => [name, type];
}
