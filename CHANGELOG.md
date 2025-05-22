## 1.1.5

* feat: 新增BaseStatePage和BaseStateStatusPage解决重复页面跳转时，GlobalKey重复使用的问题

## 1.1.4

* feat: change LifecycleControl to mixin class
* feat: 依赖库升级

## 1.1.3

* fixed: 修复initRepeatTag修改tagRepeat时，controller未被回收的问题

## 1.1.2

* feat: 更新文档

## 1.1.1

* feat: 在page中新增属性：resizeToAvoidBottomInset，用于控制页面是否自动适应键盘弹出

## 1.1.0

* feat: 新增生命周期回调 `onFrontStage`、`onBackStage`、`onResume` 和 `onPause`
* feat: 解决页面重复跳转复用Controller导致GlobalKey复用问题，示例：KeyPage

## 1.0.8

* fixed: 修复热重载导致GlobalKey被重复使用的问题并新增相关示例
* fixed: 修复在PageView中controller刚创建就被回收的问题

## 1.0.7

* 移除controller中的onKeyboardShow、onKeyboardHide
* 在page中新增方法：init，可用于初始化数据
* 在page中新增参数：permanentController，用于控制是否永久保留controller

## 1.0.6

* fixed: BuildContext未挂载判断

## 1.0.5

* 在controller中新增BuildContext属性
* 在controller中新增方法：onKeyboardShow、onKeyboardHide，用于键盘弹出和收起时回调
* 在page中新增属性：extendBody，用于控制页面内容是否延伸到底部

## 1.0.4

* fixed: 使用replace的方式进行页面替换时，多页面不复用controller的规则错乱

## 1.0.3

* 支持多页面不复用controller

## 1.0.2

* 新增新的 State 默认实现

## 1.0.1

* 新增字段支持是否复用controller

## 1.0.0

* 基础MVC框架封装
