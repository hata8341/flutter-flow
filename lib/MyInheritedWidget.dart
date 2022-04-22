import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final int count;

  const MyInheritedWidget({Key? key, required this.count, required this.child})
      : super(key: key, child: child);

  @override
  final Widget child;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
        as MyInheritedWidget;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return (oldWidget.count != count && count % 2 == 0);
  }
}
