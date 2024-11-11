import 'dart:math';

import 'package:flutter/material.dart';
import 'package:packagist_mvc/base/base_controller.dart';

import 'sub_view_model.dart';

class SubViewController extends BaseController<SubViewModel> {
  int index = 0;

  @override
  SubViewModel model = SubViewModel();

  @override
  void onReady() {
    super.onReady();
    model.data = "Page onReady $index";
    update();
  }

  @override
  void onClose() {
    model.data = "Page Close $index";
    super.onClose();
    update();
  }
}

extension Private on SubViewController {}

extension GetData on SubViewController {
  Color get randomColor => model.colors[Random().nextInt(model.colors.length)];

  String get data => model.data;
}

extension SetData on SubViewController {}

extension Action on SubViewController {}

extension Network on SubViewController {}
