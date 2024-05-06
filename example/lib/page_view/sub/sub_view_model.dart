import 'package:flutter/material.dart';
import 'package:mvc/base/base_model.dart';

class SubViewModel extends BaseModel {
  List<Color> colors = [
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.yellow.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.pink.shade100,
    Colors.teal.shade100,
    Colors.cyan.shade100,
    Colors.indigo.shade100,
  ];

  String data = "Hello World!";
}
