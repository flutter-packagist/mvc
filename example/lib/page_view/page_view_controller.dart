import 'package:mvc/base/base_controller.dart';

import 'page_view_model.dart';

class PageViewController extends BaseController<PageViewModel> {
  @override
  PageViewModel model = PageViewModel();
}

extension Private on PageViewController {}

extension GetData on PageViewController {}

extension SetData on PageViewController {}

extension Action on PageViewController {}

extension Network on PageViewController {}