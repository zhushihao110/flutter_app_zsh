import 'package:flutter/material.dart';

// 状态在组件内部管理
class TapBoxA extends StatefulWidget {
  final int conuter;

  const TapBoxA({Key? key, this.conuter = 666});

  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  final bool _isActive = false;
  int number = 0;

  void _handleTap() {
    // setState(() => _isActive = !_isActive);
    // print(context);
    Navigator.pop(context, '跳转参数');
  }

  @override
  Widget build(BuildContext context) {
    number = widget.conuter;
    return Scaffold(
        // 如果没有 scafflod 包裹一层， 则text 会显示出两条下划线
        body: Center(
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              _isActive ? '$number' : '$number',
              style: const TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
              color: _isActive ? Colors.lightGreen[700] : Colors.grey[500]),
        ),
      ),
    ));
  }
}
