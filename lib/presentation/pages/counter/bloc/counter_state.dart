import '../../../shared/bloc/base/base_bloc.dart';

abstract class CounterState extends BaseState {
  const CounterState();
}

class CounterInitial extends CounterState {
  const CounterInitial();
}

class CounterLoading extends CounterState {
  const CounterLoading();
}

class CounterLoaded extends CounterState {
  final int count;
  
  const CounterLoaded({required this.count});
  
  @override
  List<Object?> get props => [count];
}

class CounterError extends CounterState {
  final String message;
  
  const CounterError({required this.message});
  
  @override
  List<Object?> get props => [message];
} 