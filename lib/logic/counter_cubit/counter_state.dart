import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool isIncremented;

  const CounterState({required this.counterValue, required this.isIncremented});

  @override
  String toString() {
    return "The Current CounterValue is $counterValue, isIncremented: $isIncremented";
  }

  @override
  List<Object?> get props => [counterValue, isIncremented];
}
