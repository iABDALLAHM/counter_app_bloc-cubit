import 'package:bloc/bloc.dart';
import 'package:counter_app/logic/counter_bloc/counter_events.dart';
import 'package:counter_app/logic/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0, isIncremented: false)) {
    on<IncrementRequest>((event, emit) {
      emit(
        CounterState(counterValue: state.counterValue + 1, isIncremented: true),
      );
    });

    on<DecrementRequest>((event, emit) {
      emit(
        CounterState(
          counterValue: state.counterValue - 1,
          isIncremented: false,
        ),
      );
    });

    on<ResetRequest>((event, emit) {
      emit(CounterState(counterValue: 0, isIncremented: false));
    });
  }
}
