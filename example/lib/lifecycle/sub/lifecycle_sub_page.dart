import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'lifecycle_sub_controller.dart';
import 'lifecycle_sub_model.dart';

class LifecycleSubPage extends BasePage<LifecycleSubController, LifecycleSubModel> {
  const LifecycleSubPage({super.key});

  @override
  LifecycleSubController get binding => LifecycleSubController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return Center();
  }
}