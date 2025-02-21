import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';
import 'base_model.dart';
import 'base_page_interface.dart';
import 'lifecycle_observer.dart';
import 'mvc_setting.dart';
import 'page_stack.dart';

abstract class BasePage<T extends BaseController, M extends BaseModel>
    extends StatefulWidget implements GetXInterface<T, M>, PageInterface {
  const BasePage({super.key});

  @override
  T get controller {
    if (Get.isRegistered<T>(tag: tag)) {
      return Get.find<T>(tag: tag);
    }
    return Get.put<T>(binding, tag: tag, permanent: permanentController);
  }

  @override
  M get model => controller.model as M;

  @override
  bool get reuseController => true;

  @override
  bool get permanentController => false;

  @override
  String get tagSymbol => "page";

  @override
  String? get tagRepeat => null;

  @override
  String? get tag {
    if (!reuseController) {
      if (tagRepeat != null) return tagRepeat;
      return PageStack.current(tagSymbol);
    }
    return null;
  }

  @override
  Color get backgroundColor => MvcSetting().backgroundColor;

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  bool get extendBodyBehindAppBar => false;

  @override
  bool get extendBody => false;

  @override
  bool get enableWillPop => false;

  @override
  double get appBarHeight => MvcSetting().appBarHeight;

  @override
  Widget? get appBar => MvcSetting().appBar;

  @override
  Widget? get bottomBar => null;

  @protected
  void init() {}

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
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: extendBody,
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

  /// 满足以下条件时使用，为了防止热重载而导致GlobalKey被重复使用：
  /// 1.页面需要重复跳转 且reuseController为false
  /// 2.页面中引用了controller或者model中声明且已经创建的GlobalKey对象
  @protected
  void initRepeatTag(String? tag) {}

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
    extends State<P> with RouteAware {
  String? currentTag;

  @override
  void initState() {
    if (!widget.reuseController) {
      currentTag = PageStack.push(widget.tagSymbol);
      widget.initRepeatTag(currentTag);
    }
    Get.put<T>(widget.binding as T,
        tag: widget.tag, permanent: widget.permanentController);
    widget.controller.context = context;
    widget.init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lifecycleObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    widget.initRepeatTag(currentTag);
    return widget.build(context);
  }

  @override
  void dispose() {
    lifecycleObserver.unsubscribe(this);
    Get.delete<T>(tag: widget.tag);
    if (!widget.reuseController) {
      PageStack.pop(widget.tagSymbol, currentTag);
    }
    super.dispose();
  }

  @override
  void didPush() {
    widget.controller.onResume();
  }

  @override
  void didPushNext() {
    widget.controller.onPause();
  }

  @override
  void didPop() {
    widget.controller.onPause();
  }

  @override
  void didPopNext() {
    widget.controller.onResume();
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
