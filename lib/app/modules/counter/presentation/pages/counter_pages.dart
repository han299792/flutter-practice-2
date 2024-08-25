import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/app/di/locator.dart';
import 'package:flutter_practice/app/modules/counter/presentation/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CounterBloc>(),
      child: const _Layout(),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text('Hello World! ${state.value}');
            }),
            ElevatedButton(
              onPressed: () => context
                  .read<CounterBloc>()
                  .add(const CounterEvent.increase()),
              child: const Text('Incresed'),
            ),
            ElevatedButton(
              onPressed: () => context
                  .read<CounterBloc>()
                  .add(const CounterEvent.decrease()),
              child: const Text('decresed'),
            ),
          ],
        ),
      ),
    );
  }
}
