import 'package:mobx/mobx.dart';
part 'tab_store.g.dart';

class TabStore extends  _TabStoreBase with _$TabStore{}

abstract class _TabStoreBase with Store {
  @observable
  var tab = true;

  @action
  changeTab() {
    tab = !tab;
  }
}
