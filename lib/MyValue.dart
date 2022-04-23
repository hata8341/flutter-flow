import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'myvalue.freezed.dart';

@freezed
class MyValue with _$MyValue {
  const factory MyValue({@Default(0.0) double value}) = _MyValue;
}

class MyValueStateNotifer extends StateNotifier<MyValue> {
  MyValueStateNotifer() : super(const MyValue());
  change(newValue) => state = state.copyWith(value: newValue);
}
