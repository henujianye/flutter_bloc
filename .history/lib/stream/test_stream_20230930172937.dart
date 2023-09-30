import 'dart:async';

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
            //多个数据源
            // fromFutures();
            //单对单监听
            // listen();
            //广播
            // boardcast();
            //任务跳过
            // opt();
            //StreamController监听
            scListen();
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
  Future<String> funii = Future(() {
    return 'wnewen';
  });

  fromFutures() async {
    Stream<String> stream = Stream<String>.fromFutures([
      funi,
      funii,
    ]);
    await printStream(stream);
  }

  //单对单监听
  listen() async {
    Stream<int> stream =
        Stream<int>.periodic(Duration(seconds: 1), (val) => val);
    stream.listen(
      (event) {
        print(event);
      },
      onError: (err) {
        print(err);
      },
      onDone: () {},
      cancelOnError: true,
    );
  }

  //广播
  boardcast() async {
    Stream<int> stream =
        Stream<int>.periodic(Duration(seconds: 1), (val) => val)
            .asBroadcastStream();
    stream.listen((event) {
      print(event);
    });
    stream.listen((event) {
      print(event);
    });
  }

  opt() async {
    Stream<int> stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
    stream = stream.take(3);
    // stream = stream.skip(3);

    stream.listen((event) {
      print(event);
    });
  }

  scListen() async {
    StreamController sc = StreamController(
        onListen: () => print("onListen"),
        onPause: () => print("onPause"),
        onResume: () => print("onResume"),
        onCancel: () => print("onCancel"),
        sync: false);
    StreamSubscription ss = sc.stream.listen(((event) {
      print(event);
    }));

    sc.add(100);

    // // 暂停
    // ss.pause();
    // // 恢复
    // ss.resume();
    // // 取消
    // ss.cancel();

    // // 关闭流
    // sc.close();
  }
}
