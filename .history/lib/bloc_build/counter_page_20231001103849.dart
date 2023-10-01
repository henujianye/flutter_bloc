import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
        bloc: CounterBloc(),
        builder: (context, count) {
    Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: 
           Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          )
        ,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterIncrementPressed()),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterIncrementPressed())),
          ),
        ],
      )
      },
      )
    );
  }
}
