abstract class CounterEvent {}

class IncrementRequest extends CounterEvent {}

class DecrementRequest extends CounterEvent {}

class ResetRequest extends CounterEvent {}
