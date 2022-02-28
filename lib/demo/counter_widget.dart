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
  bool _switchValue = false;
  bool _checkboxValue = false;

  @override
  void initState() {
    super.initState();
    print(widget.initCounter);
    _counter = widget.initCounter;
    print('initState');
  }

  void switchOnChanged(value) {
    setState(() {
      _switchValue = value;
      print(value);
    });
  }

  void checkboxOnChanged(value) {
    setState(() {
      _checkboxValue = value;
      print('--- _checkboxValue  value  is $_checkboxValue --- ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('测试Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text('$_counter'),
                onPressed: () => {
                  // setState(() => ++_counter)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TapBoxA(
                        conuter: _counter,
                      );
                    }),
                  )
                },
              ),
              ElevatedButton(
                onPressed: () {
                  print(_counter);
                },
                child: const Text('按钮'),
              ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 200.0,
              ),
              const Icon(
                Icons.fingerprint,
                color: Colors.green,
                size: 50.0,
              ),
              Switch(
                value: _switchValue,
                onChanged: switchOnChanged,
                activeColor: Colors.green,
              ),
              Checkbox(
                  value: _checkboxValue,
                  onChanged: checkboxOnChanged,
                  activeColor: Colors.green)
            ],
          ),
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
