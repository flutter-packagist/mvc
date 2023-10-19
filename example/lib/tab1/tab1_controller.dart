import 'package:mvc/base/base_controller.dart';

import 'tab1_model.dart';

class Tab1Controller extends BaseController<Tab1Model> {
  @override
  Tab1Model model = Tab1Model();
}

extension Private on Tab1Controller {}

extension GetData on Tab1Controller {}

extension SetData on Tab1Controller {}

extension Action on Tab1Controller {
  void increment() {
    model.count++;
    update();
  }
}

extension Network on Tab1Controller {}
