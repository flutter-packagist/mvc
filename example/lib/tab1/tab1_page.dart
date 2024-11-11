import 'package:flutter/material.dart';
import 'package:packagist_mvc/base/base_page.dart';

import 'tab1_controller.dart';
import 'tab1_model.dart';

class Tab1Page extends BasePage<Tab1Controller, Tab1Model> {
  const Tab1Page({super.key});

  @override
  State<BasePage> createState() => KeepAliveState<Tab1Page, Tab1Controller>();

  @override
  Tab1Controller get binding => Tab1Controller();

  @override
  String get tagSymbol => "tab1";

  @override
  bool get reuseController => false;

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tab1 Count: ${model.count}',
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
