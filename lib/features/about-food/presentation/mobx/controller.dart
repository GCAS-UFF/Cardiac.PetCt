import 'package:mobx/mobx.dart';

class Controller {
  var index = Observable(true);
  Action  changeTab;

  Controller(){
    changeTab = Action(_changeTab);
  }

  _changeTab() {
    index.value == true ? index.value = false : index.value = true;
  }
}
