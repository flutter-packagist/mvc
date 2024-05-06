import 'package:flutter/widgets.dart';
import 'package:mvc/base/base_controller.dart';

import 'main_model.dart';

class MainController extends BaseController<MainModel> {
  @override
  MainModel model = MainModel();
}

extension Private on MainController {}

extension GetData on MainController {
  Map<String, Widget> get pageData => model.pageData;
}

extension SetData on MainController {}

extension Action on MainController {}

extension Network on MainController {}