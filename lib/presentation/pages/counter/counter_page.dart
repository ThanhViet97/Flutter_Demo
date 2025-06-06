import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter Example'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                const SizedBox(height: 20),
                _buildCounterDisplay(state),
                const SizedBox(height: 30),
                _buildActionButtons(context),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterBloc>().add(const CounterIncremented()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCounterDisplay(CounterState state) {
    return switch (state) {
      CounterInitial() => const Text(
          '0',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      CounterLoading() => const CircularProgressIndicator(),
      CounterLoaded(:final count) => Text(
          '$count',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      CounterError(:final message) => Text(
          'Error: $message',
          style: TextStyle(color: Colors.red),
        ),
      _ => const Text(
          'Unknown State',
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
    };
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () => context.read<CounterBloc>().add(const CounterDecremented()),
          icon: const Icon(Icons.remove),
          label: const Text('Decrement'),
        ),
        ElevatedButton.icon(
          onPressed: () => context.read<CounterBloc>().add(const CounterReset()),
          icon: const Icon(Icons.refresh),
          label: const Text('Reset'),
        ),
      ],
    );
  }
} 