import 'package:flutter/widgets.dart';
import 'package:packagist_mvc/base/base_model.dart';

import '../key/key_page.dart';
import '../lifecycle/lifecycle_page.dart';
import '../mvc/mvc_page.dart';
import '../page_view/page_view_page.dart';

class MainModel extends BaseModel {
  Map<String, Widget> pageData = {
    'TabBar mvc 页面回收': const MvcPage(),
    '页面重复跳转复用Controller导致GlobalKey复用问题': KeyPage(),
    'PageView 滚动促进页面回收': const PageViewPage(),
    '生命周期': const LifecyclePage(),
  };
}
