import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
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

  Future<void> _incrementCounter() async {
    var recivePort = ReceivePort();
    var sendPort = recivePort.sendPort;
    late Capability capability;

    recivePort.listen((message) {
      print(message);
      recivePort.close();
    });

    final isolate = await Isolate.spawn(child, sendPort);

    Timer(const Duration(seconds: 5), () {
      print('pausing');
      capability = isolate.pause();
    });

    Timer(const Duration(seconds: 10), () {
      print('resume');
      isolate.resume(capability);
    });

    Timer(const Duration(seconds: 15), () {
      print('kill');
      isolate.kill();
    });

    setState(() {
      _counter++;
    });
  }

  static void child(SendPort sendPort) {
    int i = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      return sendPort.send(i++);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('ボタンをタップした回数: '),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
