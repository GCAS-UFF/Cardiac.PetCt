import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/classification.dart';

class ClassificationModel extends Classification {
  ClassificationModel({@required id, @required name, @required type})
      : super(
          id: id,
          name: name,
          type: type,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (name != null) json['name'] = name;
    if (type != null) json['group'] = type;

    return json;
  }

  factory ClassificationModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return ClassificationModel(
      id: json['id'],
      name: json['name'],
      type: json['group'],
    );
  }

  factory ClassificationModel.fromEntity(Classification classification) {
    if (classification == null) return null;
    return ClassificationModel(
      id: classification.id,
      name: classification.name,
      type: classification.type,
    );
  }

  factory ClassificationModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> classificationMap = dataSnapshot.value;
    classificationMap['id'] = dataSnapshot.key;

    return ClassificationModel.fromJson(classificationMap);
  }
}
