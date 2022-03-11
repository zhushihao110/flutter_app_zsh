// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FunctionDemo extends StatefulWidget {
  const FunctionDemo({Key? key}) : super(key: key);

  @override
  _FunctionDemoState createState() => _FunctionDemoState();
}

class _FunctionDemoState extends State<FunctionDemo> {
  DateTime? _lastPress = DateTime.now();

  Future<bool> _onWillPop() async {
    if (_lastPress == null ||
        DateTime.now().difference(_lastPress!) > const Duration(seconds: 2)) {
      //两次点击间隔超过1秒则重新计时
      print('拒绝导航返回');

      setState(() {
        _lastPress = DateTime.now();
      });
      print(_lastPress);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Column(
          children: [const Text('测试导航拦截'), Text(_lastPress.toString())],
        ),
        onWillPop: _onWillPop);
  }
}
