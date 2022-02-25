import 'package:flutter/material.dart';

// 状态在组件内部管理
class TapBoxA extends StatefulWidget {
  const TapBoxA({Key? key}) : super(key: key);
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _isActive = false;

  void _handleTap() {
    // setState(() => _isActive = !_isActive);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 如果没有 scafflod 包裹一层， 则text 会显示出两条下划线
        body: Center(
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              _isActive ? 'Active' : 'InActive',
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
