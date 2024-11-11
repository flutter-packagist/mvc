import 'package:flutter/material.dart';
import 'package:packagist_mvc/base/base_page.dart';

import 'main_controller.dart';
import 'main_model.dart';

class MainPage extends BasePage<MainController, MainModel> {
  const MainPage({super.key});

  @override
  MainController get binding => MainController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return ListView.builder(
      itemCount: controller.pageData.length,
      itemBuilder: (context, index) {
        final key = controller.pageData.keys.elementAt(index);
        final value = controller.pageData[key]!;
        return ListTile(
          title: Text(key),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => value,
              ),
            );
          },
        );
      },
    );
  }
}
