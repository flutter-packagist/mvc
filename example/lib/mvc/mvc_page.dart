import 'package:example/tab1/tab1_page.dart';
import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import '../tab2/tab2_page.dart';
import 'mvc_controller.dart';
import 'mvc_model.dart';

class MvcPage extends BasePage<MvcController, MvcModel> {
  const MvcPage({super.key});

  @override
  MvcController get binding => MvcController();

  @override
  String get tagSymbol => "mvc";

  @override
  bool get reuseController => false;

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return super.build(context);
  }

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Text(
            'Count: ${model.count}',
          ),
          TextButton(
            onPressed: controller.increment,
            child: const Text('Increment'),
          ),
          TextButton(
            onPressed: controller.jump,
            child: const Text('Jump'),
          ),
          TextButton(
            onPressed: controller.replace,
            child: const Text('Replace'),
          ),
          const TabBar(tabs: [
            Tab(text: 'Tab1'),
            Tab(text: 'Tab2'),
          ]),
          const Expanded(
            child: TabBarView(children: [
              Tab1Page(),
              Tab2Page(),
            ]),
          ),
        ],
      ),
    );
  }
}
