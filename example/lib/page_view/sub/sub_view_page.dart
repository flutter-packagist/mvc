import 'package:flutter/material.dart';
import 'package:packagist_mvc/base/base_page.dart';

import 'sub_view_controller.dart';
import 'sub_view_model.dart';

class SubViewPage extends BasePage<SubViewController, SubViewModel> {
  final int index;

  const SubViewPage(this.index, {super.key});

  @override
  void init() {
    controller.index = index;
  }

  @override
  SubViewController get binding => SubViewController();

  @override
  bool get reuseController => false;

  @override
  String get tagSymbol => "sub_view";

  @override
  Widget get body {
    return Container(
      color: controller.randomColor,
      child: Center(
        child: Text(
          controller.data,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
