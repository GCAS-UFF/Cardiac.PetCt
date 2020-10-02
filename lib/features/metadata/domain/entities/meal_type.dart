import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MealType extends Equatable {
  final String id;
  final String name;
  final String type;

  MealType({@required this.id, @required this.name, @required this.type});

  @override
  List<Object> get props => [id, name, type];
}
