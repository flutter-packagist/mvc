import 'package:packagist_mvc/base/base_controller.dart';

import 'lifecycle_sub_model.dart';

class LifecycleSubController extends BaseController<LifecycleSubModel> {
  @override
  LifecycleSubModel model = LifecycleSubModel();
}

extension Private on LifecycleSubController {}

extension GetData on LifecycleSubController {}

extension SetData on LifecycleSubController {}

extension Action on LifecycleSubController {}

extension Network on LifecycleSubController {}