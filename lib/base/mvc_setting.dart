import 'package:flutter/material.dart';

import 'status_view.dart';

typedef WidgetBuilder = Widget Function(Function() onRetry);

class MvcSetting {
  factory MvcSetting() => _instance ??= MvcSetting._();
  static MvcSetting? _instance;

  MvcSetting._();

  Color? _backgroundColor;
  double? _appBarHeight;
  Widget? _appBar;
  Widget? _statusLoading;
  WidgetBuilder? _statusEmpty;
  WidgetBuilder? _statusError;

  void init({
    Color? backgroundColor = Colors.white,
    double? appBarHeight = 50,
    Widget? appBar,
    Widget? statusLoading,
    WidgetBuilder? statusEmpty,
    WidgetBuilder? statusError,
  }) {
    _backgroundColor = backgroundColor;
    _appBarHeight = appBarHeight;
    _appBar = appBar;
    _statusLoading = statusLoading ?? const StatusLoading();
    _statusEmpty = statusEmpty ?? (onRetry) => const StatusEmpty();
    _statusError = statusError ?? (onRetry) => StatusError(onRetry: onRetry);
  }

  Color get backgroundColor => _backgroundColor ?? Colors.white;

  double get appBarHeight => _appBarHeight ?? 50;

  Widget? get appBar => _appBar;

  Widget get statusLoading => _statusLoading ?? const StatusLoading();

  WidgetBuilder get statusEmpty =>
      _statusEmpty ?? (onRetry) => const StatusEmpty();

  WidgetBuilder get statusError =>
      _statusError ?? (onRetry) => StatusError(onRetry: onRetry);
}
