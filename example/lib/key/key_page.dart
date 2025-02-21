import 'package:flutter/material.dart';
import 'package:packagist_mvc/base/base_page.dart';

import 'key_controller.dart';
import 'key_model.dart';

//ignore: must_be_immutable
class KeyPage extends BasePage<KeyController, KeyModel> {
  KeyPage({super.key});

  /// ======= 解决页面重复跳转复用Controller导致GlobalKey复用问题 start =======
  String? repeatTag;

  @override
  void initRepeatTag(String? tag) {
    repeatTag = "111" + tag.toString();
  }

  @override
  String? get tagRepeat => repeatTag;

  /// ======= 解决页面重复跳转复用Controller导致GlobalKey复用问题 end   =======

  @override
  KeyController get binding => KeyController();

  @override
  String get tagSymbol => "KeyPage";

  @override
  bool get reuseController => false;

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
