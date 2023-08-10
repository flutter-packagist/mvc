# MVC基础框架

+ [Example](https://github.com/flutter-packagist/example/tree/main/lib/page/mvc)

## Getting Started

### model class

``` dart
class MvcModel extends BaseModel {
}
```

### controller class

``` dart
class MvcController extends BaseController<MvcModel> {
  @override
  MvcModel model = MvcModel();
}

extension Data on MvcController {}

extension Action on MvcController {}

extension Network on MvcController {}
```

### view class

``` dart
class MvcPage extends BasePage<MvcController, MvcModel> {
  const MvcPage({super.key});

  @override
  MvcController putController() => Get.put(MvcController());

  @override
  String? get tag => null;
  
  @override
  Color get backgroundColor => Colors.white;

  @override
  Widget? get appBar => AppBar(
        title: const Text('Title'),
      );

  @override
  Widget get body {
    return Center();
  }
}
```

## TabController init

### view class

``` dart
class MvcPage extends BasePage<MvcController, MvcModel> {

  ......
   
  @override
  Widget get body {
    return Column(children: [
      TabBar(
        controller: model.tabController,
        onTap: (int index) {
          model.tabController.animateTo(index);
        },
        tabs: const [
          Tab(text: 'Tab1'),
          Tab(text: 'Tab2'),
        ],
        labelColor: Colors.black,
      ),
      Expanded(
        child: TabBarView(
          controller: model.tabController,
          children: const [
            MvcTab1Page(),
            MvcTab2Page(),
          ],
        ),
      ),
    ]);
  }

  @override
  State<BasePage> createState() => TabControllerState<MvcPage, MvcController>();

  @override
  void initTabController(TickerProvider vsync) {
    model.tabController = TabController(length: 2, vsync: vsync);
  }
}
```

## KeepAlive

### view class

``` dart
class MvcPage extends BasePage<MvcController, MvcModel> {

  ......
   
  @override
  State<BasePage> createState() =>
      KeepAliveState<MvcTab2Page, MvcTab2Controller>();
}
```

## View Status Switch

### controller class

``` dart
class MvcController extends BaseStatusController<MvcModel> {
  @override
  MvcModel model = MvcModel();

  @override
  void onReady() {
    super.onReady();
    toContent();
  }

  @override
  void onRetry() {
    onStatusSwitch();
  }
}

extension Action on MvcController {
  void onStatusSwitch() {
    model.count++;
    if (model.count % 5 == 0) {
      toLoading();
      Future.delayed(const Duration(seconds: 2), () => toContent());
    } else if (model.count % 2 == 0) {
      toLoading();
      Future.delayed(const Duration(seconds: 2), () => toEmpty());
    } else {
      toLoading();
      Future.delayed(const Duration(seconds: 2), () => toError());
    }
  }
}
```

### view class

``` dart
class MvcPage extends BaseStatusPage<MvcController, MvcModel> {
  const MvcPage({super.key});

  @override
  MvcController putController() => Get.put(MvcController());

  @override
  Widget get loading => super.loading;

  @override
  Widget get error => GestureDetector(
        onTap: controller.onRetry,
        child: super.error,
      );

  @override
  Widget get empty => GestureDetector(
        onTap: controller.onRetry,
        child: super.empty,
      );

  @override
  Widget get body {
    return Center(
      child: TextButton(
        onPressed: controller.onStatusSwitch,
        child: const Text('MVC加载状态切换测试，\n点击进入加载状态'),
      ),
    );
  }
}
```