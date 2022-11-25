import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_concept/constants/enums.dart';
import 'package:flutter_bloc_concept/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  void onChange(Change<CounterState> change) {
    // TODO: implement onChange
    print(change.currentState.counterValue.toString());
    print(change.nextState.counterValue.toString());
    super.onChange(change);
  }
}
