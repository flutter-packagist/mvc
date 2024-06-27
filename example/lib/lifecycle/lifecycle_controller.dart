import 'package:example/lifecycle/sub/lifecycle_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:mvc/base/base_controller.dart';

import 'lifecycle_model.dart';

class LifecycleController extends BaseController<LifecycleModel> {
  @override
  LifecycleModel model = LifecycleModel();

  @override
  void onFrontStage() {
    print('onFrontStage');
  }

  @override
  void onBackStage() {
    print('onBackStage');
  }

  @override
  void onResume() {
    print('onResume');
  }

  @override
  void onPause() {
    print('onPause');
  }
}

extension Private on LifecycleController {}

extension GetData on LifecycleController {}

extension SetData on LifecycleController {}

extension Action on LifecycleController {
  void onTap() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LifecycleSubPage()),
    );
  }
}

extension Network on LifecycleController {}
