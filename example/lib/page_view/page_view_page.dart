import 'package:example/page_view/sub/sub_view_page.dart';
import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'page_view_controller.dart';
import 'page_view_model.dart';
import 'sub_keep_alive/sub_view_page.dart';

class PageViewPage extends BasePage<PageViewController, PageViewModel> {
  const PageViewPage({super.key});

  @override
  PageViewController get binding => PageViewController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return Column(children: [
      Expanded(
        child: PageView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return SubKeepAlivePage(index);
          },
        ),
      ),
      Expanded(
        child: PageView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return SubViewPage(index);
          },
        ),
      ),
    ]);
  }
}
