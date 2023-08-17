import 'package:flutter/widgets.dart';

abstract class PageInterface {
  Color get backgroundColor;

  bool get extendBodyBehindAppBar;

  bool get enableWillPop;

  double get appBarHeight;

  Widget? get appBar;

  Widget? get bottomBar;

  Widget get scaffold;

  Widget get statusBody;

  Widget get body;
}

abstract class ResponsiveInterface {
  Color? get backgroundColor;

  Widget get defaultBody;

  Widget? get desktopBody;

  Widget? get tabletBody;

  Widget? get mobileBody;

  Widget? get watchBody;
}

abstract class PageStatusInterface {
  Widget get loading;

  Widget get empty;

  Widget get error;
}

abstract class GetXInterface<T, M> {
  T get controller;

  M get model;

  String? get tag;

  bool? get reuseController;

  T get binding;
}
