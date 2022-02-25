import 'package:flutter/material.dart';
import './tap_box_b.dart';

class ParentBox extends StatefulWidget {
  const ParentBox({Key? key}) : super(key: key);

  @override
  _ParentBoxState createState() => _ParentBoxState();
}

class _ParentBoxState extends State<ParentBox> {
  bool _isActive = false;

  void _handelTap(bool newValue) {
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxB(active: _isActive, onChange: _handelTap);
  }
}
