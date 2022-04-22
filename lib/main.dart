import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import 'mydata.dart';

// 1.グローバル変数にProviderを設定
final _mydataProvider =
    StateNotifierProvider<MyData, double>((ref) => MyData());

void main() {
  // 2.ProviderScopeを設定
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 3.ConsumerWidgetを使い、watchを使えるようにする
          Consumer(builder: (context, ref, child) {
            return Text(
              // 4.watch関数にプロバイダーを渡し、stateを取り出す
              ref.watch(_mydataProvider).toStringAsFixed(2),
              style: const TextStyle(fontSize: 100),
            );
          }),
          Consumer(builder: (context, ref, child) {
            return Slider(
                value: ref.watch(_mydataProvider),
                // 5.context.readにプロバイダーのnotifierを与えて、メソッドを呼び出す
                onChanged: (value) =>
                    ref.read(_mydataProvider.notifier).changeState(value));
          }),
        ],
      ),
    );
  }
}
