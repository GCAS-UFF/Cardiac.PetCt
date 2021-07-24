import 'package:firebase_database/firebase_database.dart';

class GenericConverter {
  static Model genericFromJson<Model>(String type, Map<dynamic, dynamic> json) {
    if (type == "Meal") {
      // return MealModel.fromJson(json) as Model;
    } else if (type == "Progress") {
      // return ProgressModel.fromJson(json) as Model;
    }else {
      return null;
    }
  }

  static List<Model> genericFromDataSnapshotList<Model>(
      String type, DataSnapshot dataSnapshot, bool done) {
    if (dataSnapshot == null) return null;

    List<Model> result = [];
    Map<dynamic, dynamic> objectTodoMap =
        dataSnapshot.value as Map<dynamic, dynamic>;
    if (objectTodoMap != null) {
      for (MapEntry<dynamic, dynamic> entry in objectTodoMap.entries) {
        Map<dynamic, dynamic> map = entry.value;
        map['id'] = entry.key;
        map['done'] = done;
        result.add(genericFromJson(type, map));
      }
    }

    return result;
  }
}
