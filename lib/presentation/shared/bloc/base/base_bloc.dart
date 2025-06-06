import 'package:equatable/equatable.dart';

/// Base state for all BLoC states
abstract class BaseState extends Equatable {
  const BaseState();
  
  @override
  List<Object?> get props => [];
}

/// Base event for all BLoC events  
abstract class BaseEvent extends Equatable {
  const BaseEvent();
  
  @override
  List<Object?> get props => [];
}

/// Common states that can be used across different BLoCs
class InitialState extends BaseState {
  const InitialState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class ErrorState extends BaseState {
  final String message;
  final String? errorCode;
  
  const ErrorState({
    required this.message,
    this.errorCode,
  });
  
  @override
  List<Object?> get props => [message, errorCode];
} 