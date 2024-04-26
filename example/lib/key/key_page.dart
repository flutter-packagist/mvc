import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'key_controller.dart';
import 'key_model.dart';

//ignore: must_be_immutable
class KeyPage extends BasePage<KeyController, KeyModel> {
  KeyPage({super.key});

  String? hotReloadTag;

  @override
  void initHotReloadTag(String? tag) {
    hotReloadTag = tag;
  }

  @override
  KeyController get binding => KeyController();

  @override
  String get tagSymbol => "KeyPage";

  @override
  String? get tagHotReload => hotReloadTag;

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              key: model.key,
              children: [],
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
          ),
        ),
      ]),
    );
  }
}
