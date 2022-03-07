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
          ),
          Container(
            color: Colors.green,
            width: 500.0,
            height: 500.0,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: FlutterLogo(
                    size: 80.0,
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.yellow,
                    height: 50.0,
                    width: 50.0,
                  ),
                  left: 50.0,
                  top: 50.0,
                ),
                Positioned(
                  child: Container(
                    color: Colors.pink,
                    height: 60.0,
                    width: 60.0,
                  ),
                  left: 50.0,
                  top: 70.0,
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange.shade700]), //背景渐变
              boxShadow: [
                BoxShadow(
                    color: Colors.red,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ],
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
