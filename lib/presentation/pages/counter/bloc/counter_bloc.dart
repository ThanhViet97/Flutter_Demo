import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncremented>(_onIncremented);
    on<CounterDecremented>(_onDecremented);
    on<CounterReset>(_onReset);
  }
  
  void _onIncremented(CounterIncremented event, Emitter<CounterState> emit) {
    final currentState = state;
    if (currentState is CounterLoaded) {
      emit(CounterLoaded(count: currentState.count + 1));
    } else {
      emit(const CounterLoaded(count: 1));
    }
  }
  
  void _onDecremented(CounterDecremented event, Emitter<CounterState> emit) {
    final currentState = state;
    if (currentState is CounterLoaded && currentState.count > 0) {
      emit(CounterLoaded(count: currentState.count - 1));
    } else {
      emit(const CounterLoaded(count: 0));
    }
  }
  
  void _onReset(CounterReset event, Emitter<CounterState> emit) {
    emit(const CounterLoaded(count: 0));
  }
} 