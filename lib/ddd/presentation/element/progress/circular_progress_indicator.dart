import 'package:flutter/material.dart';
import 'index.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  final String title;

  const DefaultCircularProgressIndicator({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(title: title, child: CircularProgressIndicator());
  }
}