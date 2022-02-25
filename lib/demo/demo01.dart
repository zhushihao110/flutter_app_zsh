import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxDemo extends StatelessWidget {
  String name;

  BoxDemo(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text('一枚有态度的程序员'),
      ),
    );
  }
}
