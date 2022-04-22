import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print('setState()が呼ばれた');
      _counter++;
    });
  }

  @override
  void initState() {
    print('initState()が呼ばれた');
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependenciesが呼ばれた');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('buildした');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
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

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print('didUpdateWidgetが呼ばれた');
    print(oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactiveが呼ばれた');
    super.deactivate();
  }

  @override
  void dispose() {
    print('disposeが呼ばれた');
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('アプリの');
    print("state = $state");
    switch (state) {
      case AppLifecycleState.inactive:
        print('非アクティブになった場合の処理');
        break;
      case AppLifecycleState.paused:
        print('停止したときの処理');
        break;
      case AppLifecycleState.resumed:
        print('再開したときの処理');
        break;
      case AppLifecycleState.detached:
        print('破棄されたときの処理');
        break;
      default:
    }
  }
}
