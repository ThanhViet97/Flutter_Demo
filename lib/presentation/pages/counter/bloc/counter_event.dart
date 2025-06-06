import '../../../shared/bloc/base/base_bloc.dart';

abstract class CounterEvent extends BaseEvent {
  const CounterEvent();
}

class CounterIncremented extends CounterEvent {
  const CounterIncremented();
}

class CounterDecremented extends CounterEvent {
  const CounterDecremented();
}

class CounterReset extends CounterEvent {
  const CounterReset();
} 