import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';
import 'base_model.dart';
import 'base_page.dart';

// ignore: must_be_immutable
abstract class BaseStatePage<T extends BaseController, M extends BaseModel>
    extends BasePage<T, M> {
  BaseStatePage({super.key});

  late final T initController;

  @override
  T get binding => initController;

  @override
  T get controller => initController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: initController,
      builder: (controller) {
        if (!enableWillPop) return scaffold;
        return WillPopScope(
          onWillPop: controller.onWillPop,
          child: scaffold,
        );
      },
    );
  }
}
