import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'base_model.dart';

abstract class ModelSetter<T extends BaseModel> {
  late T model;
}

abstract class ActionControl {
  /// 是否可以返回，用于拦截返回按钮操作
  Future<bool> onWillPop();
}

abstract class LifecycleControl {
  /// 回到前台
  void onResume() {}

  /// 退到后台
  void onPause() {}
}

abstract class BaseController<T extends BaseModel> extends GetxController
    with WidgetsBindingObserver, LifecycleControl
    implements ModelSetter<T>, ActionControl {
  late BuildContext context;

  /// 是否可以返回，用于拦截返回按钮操作
  @override
  Future<bool> onWillPop() {
    return Future.value(true);
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    } else if (state == AppLifecycleState.paused) {
      onPause();
    }
  }
}

abstract class BaseStatusController<T extends BaseModel>
    extends BaseController<T> with StateMixin {
  void changeStatus({RxStatus? status}) {
    change(null, status: status);
  }

  void toLoading() {
    changeStatus(status: RxStatus.loading());
  }

  void toEmpty() {
    changeStatus(status: RxStatus.empty());
  }

  void toError() {
    changeStatus(status: RxStatus.error());
  }

  void toContent() {
    changeStatus(status: RxStatus.success());
  }

  void onRetry() {}
}
