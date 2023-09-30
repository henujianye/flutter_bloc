import 'package:flutter/material.dart';

class TestStream extends StatelessWidget {
  const TestStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stream'),
      ),
      body: FilledButton(
          onPressed: () {
            // periodic();
            fromFuture();
          },
          child: Text('点击')),
    );
  }

  void _test() {}

  printStream(Stream<Object> stream) async {
    await for (var val in stream) {
      print(val);
    }
  }

  periodic() async {
    Stream<int> stream =
        Stream<int>.periodic(Duration(seconds: 1), (val) => val);
    await printStream(stream);
  }

  // 异步函数i
  Future<int> funi = Future(() {
    return 100;
  });

  fromFuture() async {
    Stream<int> stream = Stream<int>.fromFuture(funi);
    await printStream(stream);
  }
}
