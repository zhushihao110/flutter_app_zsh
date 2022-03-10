// ignore_for_file: file_names, deprecated_member_use, must_call_super, avoid_print

import 'package:flutter/material.dart';
import './InfiniteListView.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  _ScaffoldRoureState createState() => _ScaffoldRoureState();
}

class _ScaffoldRoureState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  // 列表控制
  ScrollController listView = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTop() {
    // print(_selectedIndex);
    listView.animateTo(.0,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  void initState() {
    listView.addListener(() {
      if (listView.offset > 300) {
        setState(() {
          showToTopBtn = true;
        });
      } else {
        setState(() {
          showToTopBtn = false;
        });
      }
    });
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
      floatingActionButton: showToTopBtn
          ? FloatingActionButton(
              //悬浮按钮
              child: const Icon(Icons.arrow_upward),
              onPressed: _onTop)
          : null,
      body: Center(
        child: InfiniteListView(listView: listView),
        // child: Scrollbar(
        // 显示进度条
        // child: SingleChildScrollView(
        //   padding: const EdgeInsets.all(20),
        //   child: Column(
        //     children: str
        //         .split("")
        //         .map(
        //           (e) => Text(
        //             e,
        //             textScaleFactor: 2.0,
        //           ),
        //         )
        //         .toList(),
        //   ),
        // ),
        // ),
      ),
    );
  }
}
