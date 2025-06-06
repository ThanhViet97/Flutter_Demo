import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // Debug: BLoC created
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Debug: State changed
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // Debug: Error occurred
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    // Debug: BLoC closed
  }
} 