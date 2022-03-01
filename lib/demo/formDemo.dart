// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'hello world!';
    _nameController.selection =
        const TextSelection(baseOffset: 1, extentOffset: 4);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form表单测试'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              focusNode: node1,
              onChanged: (value) {
                print(value);
              },
              decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              controller: _pwdController,
              focusNode: node2,
              onChanged: (value) {
                print(value);
                print(_nameController.text);
              },
              decoration: const InputDecoration(
                  labelText: '密码',
                  hintText: '你得登录密码',
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  focusScopeNode = FocusScope.of(context);
                  focusScopeNode!.requestFocus(node2);
                },
                child: const Text('移动焦点')),
            ElevatedButton(
                onPressed: () {
                  // 当所有编辑框都失去焦点时键盘就会收起
                  node1.unfocus();
                  node2.unfocus();
                },
                child: const Text('隐藏键盘')),
          ],
        ),
      ),
    );
  }
}
