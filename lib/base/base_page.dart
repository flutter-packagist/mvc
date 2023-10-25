import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/mvc_setting.dart';

import 'base_controller.dart';
import 'base_model.dart';
import 'base_page_interface.dart';
import 'page_stack.dart';

abstract class BasePage<T extends BaseController, M extends BaseModel>
    extends StatefulWidget implements GetXInterface<T, M>, PageInterface {
  const BasePage({super.key});

  @override
  T get controller {
    if (Get.isRegistered<T>(tag: tag)) {
      return Get.find<T>(tag: tag);
    }
    return Get.put<T>(binding, tag: tag);
  }

  @override
  M get model => controller.model as M;

  @override
  bool get reuseController => true;

  @override
  String get tagSymbol => "page";

  @override
  String? get tag {
    if (!reuseController) {
      return PageStack.current(tagSymbol);
    }
    return null;
  }

  @override
  Color get backgroundColor => MvcSetting().backgroundColor;

  @override
  bool get extendBodyBehindAppBar => false;

  @override
  bool get enableWillPop => false;

  @override
  double get appBarHeight => MvcSetting().appBarHeight;

  @override
  Widget? get appBar => MvcSetting().appBar;

  @override
  Widget? get bottomBar => null;

  @protected
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      tag: tag,
      builder: (controller) {
        if (!enableWillPop) return scaffold;
        return WillPopScope(
          onWillPop: controller.onWillPop,
          child: scaffold,
        );
      },
    );
  }

  @override
  Widget get scaffold {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor,
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: appBar!,
            )
          : null,
      body: statusBody,
      bottomNavigationBar: bottomBar,
    );
  }

  @override
  Widget get statusBody => body;

  @override
  State<BasePage> createState() => AutoDisposeState<BasePage, T>();

  /// 仅在 createState 为 TabControllerState 时使用
  @protected
  void initTabController(TickerProvider vsync) {}
}

abstract class BaseStatusPage<T extends BaseStatusController,
    M extends BaseModel> extends BasePage<T, M> implements PageStatusInterface {
  const BaseStatusPage({super.key});

  @override
  Widget get loading => MvcSetting().statusLoading;

  @override
  Widget get empty => MvcSetting().statusEmpty.call(controller.onRetry);

  @override
  Widget get error => MvcSetting().statusError.call(controller.onRetry);

  @override
  Widget get statusBody {
    return controller.obx(
      (state) => body,
      onLoading: loading,
      onEmpty: empty,
      onError: (e) => error,
    );
  }
}

/// 用于控制Controller的创建和销毁
class AutoDisposeState<P extends BasePage, T extends BaseController>
    extends State<P> {
  String? currentTag;

  @override
  void initState() {
    if (!widget.reuseController) {
      currentTag = PageStack.push(widget.tagSymbol);
    }
    Get.put<T>(widget.binding as T, tag: currentTag);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }

  @override
  void dispose() {
    Get.delete<T>(tag: currentTag);
    if (!widget.reuseController) {
      PageStack.pop(widget.tagSymbol, currentTag);
    }
    super.dispose();
  }
}

/// 页面需要 TabController时使用
class TabControllerState<P extends BasePage, T extends BaseController>
    extends AutoDisposeState<P, T> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.initTabController(this);
  }
}

/// 页面需要在 TabView或者PageView 中保活时使用
class KeepAliveState<P extends BasePage, T extends BaseController>
    extends AutoDisposeState<P, T> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }
}

/// TickerProviderStateMixin 和 AutomaticKeepAliveClientMixin
class TabControllerWithKeepAliveState<P extends BasePage,
        T extends BaseController> extends AutoDisposeState<P, T>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.initTabController(this);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }
}
