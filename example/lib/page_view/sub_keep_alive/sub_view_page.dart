import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'sub_view_controller.dart';
import 'sub_view_model.dart';

class SubKeepAlivePage extends BasePage<SubViewController, SubViewModel> {
  final int index;

  const SubKeepAlivePage(this.index, {super.key});

  @override
  void init() {
    controller.index = index;
  }

  @override
  SubViewController get binding => SubViewController();

  @override
  bool get reuseController => false;

  @override
  String get tagSymbol => "sub_keep_alive";

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

  @override
  State<SubKeepAlivePage> createState() =>
      TabControllerWithKeepAliveState<SubKeepAlivePage, SubViewController>();
}
