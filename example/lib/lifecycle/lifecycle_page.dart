import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'lifecycle_controller.dart';
import 'lifecycle_model.dart';

class LifecyclePage extends BasePage<LifecycleController, LifecycleModel> {
  const LifecyclePage({super.key});

  @override
  LifecycleController get binding => LifecycleController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('生命周期'),
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: controller.onTap,
            child: const Text('Lifecycle Page'),
          ),
        ],
      ),
    );
  }
}
