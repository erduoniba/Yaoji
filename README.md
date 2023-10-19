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
