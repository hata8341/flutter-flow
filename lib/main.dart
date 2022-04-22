import 'package:flutter/material.dart';
import 'package:practice/Widgets.dart';

import 'MyInheritedWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print('count: ' + _counter.toString());
  }

  final Widget _widget = const Center(
    child: WidgetA(),
  );

  @override
  Widget build(BuildContext context) {
    // InheritedWidgetが間に挟まり、childでScaffoldを指定している
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),

      body: MyInheritedWidget(count: _counter, child: _widget),
      // body: _widget,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
