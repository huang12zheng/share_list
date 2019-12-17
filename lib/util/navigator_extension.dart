import 'package:flutter/material.dart';

extension NavigatorExtendsion on Navigator{
  static Future<T> pushW<T extends Object>(
    BuildContext buildContext, Widget widget, 
    {routerName}) {
    return Navigator.of(buildContext).push(new MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: routerName)));
  }
}