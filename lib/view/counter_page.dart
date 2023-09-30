import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CounterBloc();
      },
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text('${state.value}');
            }),
            FilledButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
                },
                child: Text('加法')),
            FilledButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(CounterSubduction());
                },
                child: Text('减法')),
          ],
        ),
      ),
    );
  }
}
