import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/classification.dart';

class Food extends Equatable {
  final String id;
  final String name;
  final Classification classification;
  final String imageUrl;

  Food(
      {@required this.id,
      @required this.name,
      @required this.classification,
      @required this.imageUrl});

  @override
  List<Object> get props => [id, name, classification, imageUrl];
}
