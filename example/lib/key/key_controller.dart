import 'package:flutter/material.dart';
import 'package:mvc/base/base_controller.dart';

import 'key_model.dart';
import 'key_page.dart';

class KeyController extends BaseController<KeyModel> {
  @override
  KeyModel model = KeyModel();
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
