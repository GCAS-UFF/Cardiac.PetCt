// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TabStore on _TabStoreBase, Store {
  final _$tabAtom = Atom(name: '_TabStoreBase.tab');

  @override
  bool get tab {
    _$tabAtom.reportRead();
    return super.tab;
  }

  @override
  set tab(bool value) {
    _$tabAtom.reportWrite(value, super.tab, () {
      super.tab = value;
    });
  }

  final _$_TabStoreBaseActionController =
      ActionController(name: '_TabStoreBase');

  @override
  dynamic changeTab() {
    final _$actionInfo = _$_TabStoreBaseActionController.startAction(
        name: '_TabStoreBase.changeTab');
    try {
      return super.changeTab();
    } finally {
      _$_TabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tab: ${tab}
    ''';
  }
}
