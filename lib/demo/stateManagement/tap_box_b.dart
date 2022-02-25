// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChange;

  const TapBoxB({Key? key, this.active = false, required this.onChange});

  void _handelTap() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 如果没有 scafflod 包裹一层， 则text 会显示出两条下划线
        body: Center(
      child: GestureDetector(
        onTap: _handelTap,
        child: Container(
          child: Center(
            child: Text(
              active ? 'parent_Active' : 'parent_InActive',
              style: const TextStyle(fontSize: 28.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[500]),
        ),
      ),
    ));
  }
}
