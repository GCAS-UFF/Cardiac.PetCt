import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MealType extends Equatable {
  final String name;
  final String type;

  MealType({@required this.name, @required this.type});

  @override
  List<Object> get props => [name, type];
}
