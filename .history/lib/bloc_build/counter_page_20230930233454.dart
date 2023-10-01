import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc_build/counter_bloc.dart';

import '../bloc/bloc/counter_bloc.dart';

class CounterPage1 extends StatelessWidget {
  const CounterPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: BlocBuilder<CounterBloc1, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              '$state',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc1>().add(CounterIncrementPressed());
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
