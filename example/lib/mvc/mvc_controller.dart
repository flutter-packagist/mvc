import 'package:example/mvc/mvc_page.dart';
import 'package:flutter/material.dart';
import 'package:mvc/base/base_controller.dart';

import 'mvc_model.dart';

class MvcController extends BaseController<MvcModel> {
  @override
  MvcModel model = MvcModel();

  late BuildContext context;
}

extension Private on MvcController {}

extension GetData on MvcController {}

extension SetData on MvcController {}

extension Action on MvcController {
  void increment() {
    model.count++;
    update();
  }

  void jump() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MvcPage(),
    ));
  }

  void replace() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const MvcPage(),
    ));
  }
}

extension Network on MvcController {}
