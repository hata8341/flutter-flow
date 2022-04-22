import 'package:flutter/material.dart';
import 'package:practice/MyInheritedWidget.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyInheritedWidget _myInheritedWidget = MyInheritedWidget.of(context);
    int count = _myInheritedWidget.count;

    return Text(
      count.toString(),
      style: const TextStyle(fontSize: 100.0),
    );
  }
}
