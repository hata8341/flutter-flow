import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice/MyData.dart';

// 1.グローバル変数にProviderを設定
final _mydataProvider = StateNotifierProvider<MyData, double>((_) => MyData());

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
      body: const MyContents(),
    );
  }
}

class MyContents extends HookConsumerWidget {
  const MyContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _value = ref.watch(_mydataProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _value.toStringAsFixed(2),
          style: const TextStyle(fontSize: 100),
        ),
        Slider(
            value: _value,
            onChanged: (value) {
              return ref.read(_mydataProvider.notifier).changeState(value);
            })
      ],
    );
  }
}
