import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Classification extends Equatable {
  final String id;
  final String name;
  final String type;

  Classification({@required this.id, @required this.name, @required this.type});

  @override
  List<Object> get props => [id, name, type];
}
