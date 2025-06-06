import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/presentation/pages/counter/bloc/counter_bloc.dart';
import 'package:my_app/presentation/pages/counter/bloc/counter_event.dart';
import 'package:my_app/presentation/pages/counter/bloc/counter_state.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    tearDown(() {
      counterBloc.close();
    });

    test('initial state is CounterInitial', () {
      expect(counterBloc.state, equals(const CounterInitial()));
    });

    blocTest<CounterBloc, CounterState>(
      'emits [CounterLoaded(1)] when CounterIncremented is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(const CounterIncremented()),
      expect: () => [const CounterLoaded(count: 1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [CounterLoaded(2)] when CounterIncremented is added twice',
      build: () => counterBloc,
      act: (bloc) {
        bloc.add(const CounterIncremented());
        bloc.add(const CounterIncremented());
      },
      expect: () => [
        const CounterLoaded(count: 1),
        const CounterLoaded(count: 2),
      ],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [CounterLoaded(0)] when CounterDecremented is added from initial state',
      build: () => counterBloc,
      act: (bloc) => bloc.add(const CounterDecremented()),
      expect: () => [const CounterLoaded(count: 0)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [CounterLoaded(1), CounterLoaded(0)] when increment then decrement',
      build: () => counterBloc,
      act: (bloc) {
        bloc.add(const CounterIncremented());
        bloc.add(const CounterDecremented());
      },
      expect: () => [
        const CounterLoaded(count: 1),
        const CounterLoaded(count: 0),
      ],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [CounterLoaded(0)] when CounterReset is added',
      build: () => counterBloc,
      seed: () => const CounterLoaded(count: 5),
      act: (bloc) => bloc.add(const CounterReset()),
      expect: () => [const CounterLoaded(count: 0)],
    );
  });
} 