// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  Widget redBox =
      const DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('布局测试')),
      // body: ConstrainedBox(
      //   constraints: const BoxConstraints(minHeight: 200.0, minWidth: 200.0),
      //   child: SizedBox(
      //     height: 50.0,
      //     width: 50.0,
      //     child: redBox,
      //   ),
      // ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("测试线性布局1"),
              Text("测试线性布局2"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text("测试线性布局1"),
              Text("测试线性布局2"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.ltr,
            children: const [
              Text("测试线性布局1"),
              Text("测试线性布局2"),
            ],
          )
        ],
      ),
    );
  }
}
