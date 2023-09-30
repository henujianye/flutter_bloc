import 'package:flutter/material.dart';

class TestStream extends StatelessWidget {
  TestStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stream'),
      ),
      body: FilledButton(
          onPressed: () {
            //周期
            // periodic();
            //异步
            // fromFuture();
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
  Future<String> funi = Future(() {
    return 'nihao';
  });

  fromFuture() async {
    Stream<String> stream = Stream<String>.fromFuture(funi);
    await printStream(stream);
  }

  // 异步函数ii
  Future<int> funii = Future(() {
    return 200;
  });

  fromFutures() async {
    Stream<String> stream = Stream<String>.fromFutures([
      funi,
      funii,
    ]);
    await printStream(stream);
  }
}
