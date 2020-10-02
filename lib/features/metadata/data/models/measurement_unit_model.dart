import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/classification.dart';
import 'package:petct/features/metadata/domain/entities/measurement_unit.dart';

class MeasurementUnitModel extends Classification {
  MeasurementUnitModel({@required id, @required name, @required type})
      : super(
          id: id,
          name: name,
          type: type,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (name != null) json['name'] = name;
    if (type != null) json['type'] = type;

    return json;
  }

  factory MeasurementUnitModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MeasurementUnitModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
    );
  }

  factory MeasurementUnitModel.fromEntity(MeasurementUnit measurementUnit) {
    if (measurementUnit == null) return null;
    return MeasurementUnitModel(
      id: measurementUnit.id,
      name: measurementUnit.name,
      type: measurementUnit.type,
    );
  }

  factory MeasurementUnitModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    Map<dynamic, dynamic> measurementUnitMap = dataSnapshot.value;
    measurementUnitMap['id'] = dataSnapshot.key;

    return MeasurementUnitModel.fromJson(measurementUnitMap);
  }
}
