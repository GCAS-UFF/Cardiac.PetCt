import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:petct/features/metadata/domain/entities/measurement_group.dart';

class MeasurementGroupModel extends MeasurementGroup {
  MeasurementGroupModel({@required portion, @required measurementUnit})
      : super(
          portion: portion,
          measurementUnit: measurementUnit,
        );

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = {};

    if (portion != null) json['portion'] = portion;
    if (measurementUnit != null) json['measurementUnit'] = measurementUnit;

    return json;
  }

  factory MeasurementGroupModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;
    return MeasurementGroupModel(
      portion: json['portion'],
      measurementUnit: json['measurementUnit'],
    );
  }

  factory MeasurementGroupModel.fromEntity(MeasurementGroup measurementGroup) {
    if (measurementGroup == null) return null;
    return MeasurementGroupModel(
      portion: measurementGroup.portion,
      measurementUnit: measurementGroup.measurementUnit,
    );
  }

  factory MeasurementGroupModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    if (dataSnapshot == null) return null;

    return MeasurementGroupModel.fromJson(dataSnapshot.value);
  }

  static List<dynamic> listToJson(List<MeasurementGroupModel> list) {
    return list == null
        ? List<dynamic>()
        : list.map((item) => item.toJson()).toList();
  }

  static List<MeasurementGroupModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<MeasurementGroupModel>()
        : json.map((item) => MeasurementGroupModel.fromJson(item)).toList();
  }
}
