import 'package:mvc/base/base_controller.dart';

import 'tab2_model.dart';

class Tab2Controller extends BaseController<Tab2Model> {
  @override
  Tab2Model model = Tab2Model();
}

extension Private on Tab2Controller {}

extension GetData on Tab2Controller {}

extension SetData on Tab2Controller {}

extension Action on Tab2Controller {
  void increment() {
    model.count++;
    update();
  }
}

extension Network on Tab2Controller {}