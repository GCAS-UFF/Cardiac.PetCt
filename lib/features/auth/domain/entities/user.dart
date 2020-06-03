import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String id;
  final String name;
  final DateTime birthDate;
  final String gender;
  final String email;

  User(
      {this.id,
      @required this.name,
      @required this.birthDate,
      @required this.gender,
      @required this.email});

  @override
  List<Object> get props => [id, name, birthDate, gender, email];
}
