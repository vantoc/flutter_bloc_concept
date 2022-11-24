part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}

// class CounterInitial extends CounterState {}

class CounterState extends Equatable {
  int counterValue;
  bool? wasIncremented;

  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  List<Object> get props => [this.counterValue, this.counterValue];
}
