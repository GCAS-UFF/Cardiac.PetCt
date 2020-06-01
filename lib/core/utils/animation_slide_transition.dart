import 'package:flutter/material.dart';

class AnimationSlideTransistion extends PageRouteBuilder {
  Widget widget;
  AnimationSlideTransistion({this.widget})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget widget) {
              Animation<Offset> custom = Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ).animate(animation);
              return SlideTransition(position: custom, child: widget);
            });
}
