import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:petct/core/utils/generic_converter.dart';
import 'package:petct/features/auth/data/datasources/local_data_source.dart';
import 'package:petct/features/diet-progress/presentation/models/progress_item.dart';
import 'package:petct/features/menu/domain/entities/meal.dart';

class NotificationManager {
  static const int MEAL_NOTIFICATION_ID = 10;
  static const int PROGRESS_NOTIFICATION_ID = 20;

  final int dayInMiliseconds = 24 * 60 * 60 * 1000;

  // Create channels
  var _mealChannel = _createChannel("Meals");
  var _progressChannel = _createChannel("Progress");

  final FlutterLocalNotificationsPlugin localNotificationsPlugin;
  final FirebaseDatabase firebaseDatabase;
  final AuthLocalDataSource authLocalDataSource;

  NotificationManager(
      {@required this.localNotificationsPlugin,
      @required this.firebaseDatabase,
      @required this.authLocalDataSource});

  Future<void> init() async {
    String patientId = await authLocalDataSource.getUserId();

    await _initializeNotifications();

    await _initializeMeal(patientId, MEAL_NOTIFICATION_ID, _mealChannel);
    await _initializeProgress(
        patientId, PROGRESS_NOTIFICATION_ID, _progressChannel);
  }

  Future<void> _initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('app_logo');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
  }

  static NotificationDetails _createChannel(String channelName) {
    var androidChannel = AndroidNotificationDetails(
      channelName,
      channelName,
      channelName,
      styleInformation: BigTextStyleInformation(""),
      importance: Importance.Max,
      priority: Priority.Max,
      ongoing: true,
    );
    var iosChannel = IOSNotificationDetails();
    return NotificationDetails(androidChannel, iosChannel);
  }

  Future singleNotification(
      {@required NotificationDetails channel,
      @required DateTime datetime,
      @required String title,
      @required String body,
      @required int startId,
      String sound}) async {
    int id = _generateNotificationId(startId);
    localNotificationsPlugin.schedule(id, title, body, datetime, channel,
        payload: id.toString());
  }

  int _generateNotificationId(int startId) {
    var rng = new Random();
    String id = "$startId${rng.nextInt(99999)}";
    return int.parse(id);
  }

  Future<void> _cleanNotifications(int startId) async {
    var notifications =
        await localNotificationsPlugin.pendingNotificationRequests();
    notifications.forEach(
      (element) {
        String currentId = element.id.toString();
        if (currentId.startsWith(startId.toString())) {
          localNotificationsPlugin.cancel(element.id);
        }
      },
    );
  }

  Future<void> _initializeMeal(
      String patientId, int startId, NotificationDetails channel) async {
    await _cleanNotifications(startId);

    firebaseDatabase
        .reference()
        .child("Users")
        .child(patientId)
        .child('ToDo')
        .child("Meal")
        .onValue
        .listen((event) async {
      var snapshot = event.snapshot;
      if (snapshot == null) return;

      print("[Meal] ${snapshot.value}");

      List<Meal> mealsList =
          GenericConverter.genericFromDataSnapshotList("Meal", snapshot, false);

      mealsList.forEach((meal) async {
        if (meal.mealDate != null &&
            meal.mealDate.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
          DateTime fifteenMinutesBefore =
              meal.mealDate.subtract(new Duration(minutes: 15));
          if (fifteenMinutesBefore.isAfter(DateTime.now())) {
            await singleNotification(
              channel: channel,
              startId: startId,
              title: "Faltam 15 minutos para o ${meal.type}, fique atenta(o)",
              body: "Não se esqueça de registrar sua refeição no aplicativo.",
              datetime: fifteenMinutesBefore,
            );
          }

          DateTime halfHourBefore =
              meal.mealDate.subtract(new Duration(minutes: 30));
          if (halfHourBefore.isAfter(DateTime.now())) {
            await singleNotification(
              channel: channel,
              startId: startId,
              title: "Faltam 30 minutos para o ${meal.type}, fique atenta(o)",
              body: "Não se esqueça de registrar sua refeição no aplicativo.",
              datetime: halfHourBefore,
            );
          }
        }
      });
    });
  }

  Future<void> _initializeProgress(
      String patientId, int startId, NotificationDetails channel) async {
    await _cleanNotifications(startId);

    firebaseDatabase
        .reference()
        .child("Users")
        .child(patientId)
        .child('ToDo')
        .child("Progress")
        .onValue
        .listen((event) async {
      var snapshot = event.snapshot;
      if (snapshot == null) return;

      print("[Progress] ${snapshot.value}");

      List<ProgressItem> progressList =
          GenericConverter.genericFromDataSnapshotList(
              "Progress", snapshot, false);

      progressList.forEach((progress) async {
        if (progress.progressUpdateTime != null &&
            progress.progressUpdateTime.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
          DateTime fifteenMinutesBefore =
              progress.progressUpdateTime.subtract(new Duration(minutes: 15));
          if (fifteenMinutesBefore.isAfter(DateTime.now())) {
            await singleNotification(
              channel: channel,
              startId: startId,
              title:
                  "Faltam 15 minutos para o ${progress.title}, fique atenta(o)",
              body: "Não se esqueça de ver as dicas no aplicativo.",
              datetime: fifteenMinutesBefore,
            );
          }

          DateTime halfHourBefore =
              progress.progressUpdateTime.subtract(new Duration(minutes: 30));
          if (halfHourBefore.isAfter(DateTime.now())) {
            await singleNotification(
              channel: channel,
              startId: startId,
              title:
                  "Faltam 30 minutos para o ${progress.title}, fique atenta(o)",
              body: "Não se esqueça de ver as dicas no aplicativo.",
              datetime: halfHourBefore,
            );
          }
        }
      });
    });
  }
}
