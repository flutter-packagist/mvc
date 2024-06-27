import 'package:flutter/widgets.dart';
import 'package:mvc/base/base_model.dart';

import '../key/key_page.dart';
import '../lifecycle/lifecycle_page.dart';
import '../mvc/mvc_page.dart';
import '../page_view/page_view_page.dart';

class MainModel extends BaseModel {
  Map<String, Widget> pageData = {
    'TabBar mvc 页面回收': const MvcPage(),
    'GlobalKey 导致HotReload报错的解决方法': KeyPage(),
    'PageView 滚动促进页面回收': const PageViewPage(),
    '生命周期': const LifecyclePage(),
  };
}
