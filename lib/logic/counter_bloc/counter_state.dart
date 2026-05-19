class CounterState {
  final int counterValue;
  final bool isIncremented;

  CounterState({required this.counterValue, required this.isIncremented});

  @override
  String toString() {
    return "The Current CounterValue is $counterValue, isIncremented: $isIncremented";
  }
  
}


