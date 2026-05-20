import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print("🟢 CREATED => ${bloc.runtimeType}");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print("📩 EVENT => ${bloc.runtimeType}");
    print("Event: $event");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print("🔄 CHANGE => ${bloc.runtimeType}");
    print("Current State: ${change.currentState}");
    print("Next State: ${change.nextState}");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("🚀 TRANSITION => ${bloc.runtimeType}");

    print("Current State: ${transition.currentState}");

    print("Event: ${transition.event}");

    print("Next State: ${transition.nextState}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print("❌ ERROR => ${bloc.runtimeType}");

    print("Error: $error");

    print("StackTrace: $stackTrace");
  }

  @override
  void onClose(BlocBase bloc) {
    print("🔴 CLOSED => ${bloc.runtimeType}");
  }

  @override
  void onDone(
    Bloc bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    print("✅ DONE => ${bloc.runtimeType}");

    print("Finished Event: $event");

    if (error != null) {
      print("Error: $error");
    }
  }
}
