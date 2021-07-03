import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/menu/domain/entities/classification.dart';

class Food extends Equatable {
  final String name;
  final Classification classification;
  final String imageName;

  Food({
    @required this.name,
    @required this.classification,
    @required this.imageName,
  });

  @override
  List<Object> get props => [name, classification, imageName];
}
