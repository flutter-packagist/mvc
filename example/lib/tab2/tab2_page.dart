import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'tab2_controller.dart';
import 'tab2_model.dart';

class Tab2Page extends BasePage<Tab2Controller, Tab2Model> {
  const Tab2Page({super.key});

  @override
  State<BasePage> createState() => KeepAliveState<Tab2Page, Tab2Controller>();

  @override
  Tab2Controller get binding => Tab2Controller();

  @override
  String get tagSymbol => "tab2";

  @override
  bool? get reuseController => false;

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tab2 Count: ${model.count}',
          ),
          TextButton(
            onPressed: controller.increment,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
