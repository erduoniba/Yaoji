# yaoji

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
<!-- 查看package的依赖关系 -->

pub deps > deps.yaml

<!-- 添加第三方package -->

flutter pub add packagname

<!-- 自动生成多语言代码 -->

flutter gen-l10n

<!-- 执行后，可以自动生成json转成的model代码，持续观察持续生成 -->

flutter pub run build_runner watch

<!-- 执行后，可以自动生成json转成的model代码，执行后，遍历文件然后执行 -->

flutter pub run build_runner build --delete-conflicting-outputs

<!-- 常用的第三方package -->

https://cloud.tencent.com/developer/article/2020032?cps_key=1d358d18a7a17b4a6df8d67a62fd3d3d

```

常用 API：

```
获取屏幕的宽度
MediaQuery.of(context).size.width
获取屏幕底部安全区域高度
MediaQuery.of(context).padding.bottom
```

VSCode 快捷：

```
代码折叠
文件所有代码
折叠所有：command+k+0
展开所有：command+k+j
光标代码块
折叠：alt+command+[
展开：alt+command+]
文件和编辑操作
当前文件查找：commadn+F
当前文件查找替换：command+Option+F
全局搜索：command+shift+F
导航和窗口操作
切换侧边栏：Command + B
切换文件资源管理器：Command + Shift + E
切换编辑器分割布局：Command + 1/2/3
跳转到符号：Command + Shift + O
跳转到定义或引用：F12
跳转到行：Control + G
执行命令
Command + Shift + P
```
