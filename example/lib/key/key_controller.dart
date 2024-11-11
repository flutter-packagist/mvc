import 'package:flutter/material.dart';
import 'package:packagist_mvc/base/base_controller.dart';

import 'key_model.dart';
import 'key_page.dart';

class KeyController extends BaseController<KeyModel> {
  @override
  KeyModel model = KeyModel();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 1), () {
      update();
    });
  }
}

extension Private on KeyController {}

extension GetData on KeyController {}

extension SetData on KeyController {}

extension Action on KeyController {
  void action() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => KeyPage(),
    ));
  }
}

extension Network on KeyController {}
