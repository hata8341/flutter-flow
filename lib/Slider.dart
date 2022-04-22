import 'package:flutter/material.dart';
import 'package:practice/MyData.dart';
import 'package:provider/provider.dart';

class MySlider extends StatefulWidget {
  @override
  createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    // final mydata = Provider.of<MyData>(context);
    return Slider(
        value: context.select((MyData myData) => myData.value),
        onChanged: (value) => context.read<MyData>().value = value);
  }
}
