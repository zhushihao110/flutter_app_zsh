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
  final GlobalKey _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                focusNode: node1,
                onChanged: (value) {
                  print(value);
                },
                decoration: const InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                    prefixIcon: Icon(Icons.person)),
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : '用户名不能为空';
                },
              ),
              TextFormField(
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
                validator: (v) {
                  return v!.trim().length > 5 ? null : '密码不能少于6位';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            // print(_formKey.currentState);
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                              print(_formKey.currentState);
                            } else {
                              print('验证失败');
                            }
                          },
                          child: const Text('登录')),
                    )
                  ],
                ),
              )
              // ElevatedButton(
              //     onPressed: () {
              //       focusScopeNode = FocusScope.of(context);
              //       focusScopeNode!.requestFocus(node2);
              //     },
              //     child: const Text('移动焦点')),
              // ElevatedButton(
              //     onPressed: () {
              //       // 当所有编辑框都失去焦点时键盘就会收起
              //       node1.unfocus();
              //       node2.unfocus();
              //     },
              //     child: const Text('隐藏键盘')),
            ],
          ),
        ),
      ),
    );
  }
}
