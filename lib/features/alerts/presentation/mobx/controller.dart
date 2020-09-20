import 'package:mobx/mobx.dart';

class Controller {
  var enableAlerts = Observable(true);
  Action enableDisable;

  Controller() {
    enableDisable = Action(_changeAlertsReceive);
  }

  _changeAlertsReceive() {
    enableAlerts.value == true
        ? enableAlerts.value = false
        : enableAlerts.value = true;
  }
}
