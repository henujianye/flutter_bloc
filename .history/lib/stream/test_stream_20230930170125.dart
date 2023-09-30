import 'package:flutter/material.dart';

class TestStream extends StatelessWidget {
  const TestStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stream'),
      ),
      body: FilledButton(onPressed: () {}, child: Text('点击')),
    );
  }
}
