import 'package:flutter/material.dart';
import 'demo/counter_widget.dart';
import './demo//stateManagement/tap_box_a.dart';
import './demo//stateManagement/parent_box.dart';
import './demo/formDemo.dart';
import './demo/layoutDemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    // return const MyHomePage(title: 'Flutter练习');
    // return const MaterialApp(home: CounterWidget(initCounter: 100));
    return MaterialApp(home: LayoutDemo());
    // return const MaterialApp(home: FormDemo());
    // return const MaterialApp(home: TapBoxA());
    // return const MaterialApp(home: ParentBox());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //         title: Text('测试路由'), icon: Icon(Icons.home)),
        //     BottomNavigationBarItem(
        //         title: Text('测试路由01'), icon: Icon(Icons.book))
        //   ],
        //   onTap: (int index) {
        //     ///这里根据点击的index来显示，非index的page均隐藏
        //     print(index);
        //   },
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
