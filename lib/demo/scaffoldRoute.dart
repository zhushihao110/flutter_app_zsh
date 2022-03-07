// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  _ScaffoldRoureState createState() => _ScaffoldRoureState();
}

class _ScaffoldRoureState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {
    print(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由骨架页'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text('侧边抽屉栏'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: const Icon(Icons.add),
          onPressed: _onAdd),
      body: const Center(
        child: Text(
          '测试',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
