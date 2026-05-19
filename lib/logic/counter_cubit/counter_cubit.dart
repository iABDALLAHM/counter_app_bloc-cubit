import 'package:bloc/bloc.dart';
import 'package:counter_app/logic/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, isIncremented: false));

  void incrementButton() => emit(CounterState(counterValue: state.counterValue + 1, isIncremented: true));

  void decrementButton() => emit(CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  void resetButton() => emit(CounterState(counterValue: 0, isIncremented: false));
}
