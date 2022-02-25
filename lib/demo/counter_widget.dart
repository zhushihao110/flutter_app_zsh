// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './stateManagement/tap_box_a.dart';

class CounterWidget extends StatefulWidget {
  final int initCounter;
  // ignore: use_key_in_widget_constructors
  const CounterWidget({Key? key, this.initCounter = 0});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print(widget.initCounter);
    _counter = widget.initCounter;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('$_counter'),
          onPressed: () => {
            // setState(() => ++_counter)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const TapBoxA();
              }),
            )
          },
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
