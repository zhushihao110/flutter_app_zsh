// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

class InfiniteListView extends StatefulWidget {
  ScrollController listView;
  InfiniteListView({Key? key, required this.listView}) : super(key: key);

  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##';

  var words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  void retrieveData() {
    // 模拟获取数据，每次获取20个单词
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        words.insertAll(
          words.length - 1,
          generateWordPairs()
              .take(20)
              .map((value) => value.asPascalCase)
              .toList(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(title: Text('商品列表')),
        Expanded(
          child: ListView.separated(
            controller: widget.listView,
            itemBuilder: (context, index) {
              if (words[index] == loadingTag) {
                if (words.length - 1 < 100) {
                  retrieveData();
                  print('---进入子项内部---');
                  print(index);
                  return Container(
                    padding: const EdgeInsets.all(20),
                    child: const SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      '没有更多了',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }
              //显示单词列表项
              print('---只做展示---');
              return ListTile(title: Text(words[index]));
            },
            separatorBuilder: (context, index) =>
                const Divider(height: .0), // 增加一条下划线
            itemCount: words.length,
          ),
        )
      ],
    );
  }
}
