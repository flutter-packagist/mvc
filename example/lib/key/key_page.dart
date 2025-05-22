import 'package:flutter/material.dart';
import 'package:packagist_mvc/mvc.dart';

import 'key_controller.dart';
import 'key_model.dart';

//ignore: must_be_immutable
class KeyPage extends BaseStatePage<KeyController, KeyModel> {
  KeyPage({super.key}) {
    initController = KeyController();
  }

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return SafeArea(
      child: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            key: model.scrollKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              key: model.key,
              children: [
                Container(
                  height: 1000,
                  color: Colors.red.shade200,
                  child: const Center(child: Text('滚动区域')),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.action();
          },
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.blue,
            child: const Center(child: Text('页面重复跳转')),
          ),
        ),
      ]),
    );
  }
}
