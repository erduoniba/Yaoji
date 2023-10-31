import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaoji/common/router/router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // switchDebugMode();

    return MaterialApp.router(
      title: 'yaoji',
      // 右上角是否展示debug标识
      // debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const YJBottomTabbar(),
      routerConfig: yjRoute,
      builder: EasyLoading.init(),
    );
  }

  void switchDebugMode() {
    // 显示引导线：
    // 该功能会在你的应用顶层绘制引导线，
    // 展示绘制区域、对齐、间距、滚动视图、裁剪和空位填充。
    // debugPaintSizeEnabled = true;

    // 显示基线
    // 该选项会显示所有的基线。基线是水平的用来定位文字的线。
    // debugPaintBaselinesEnabled = true;

    // 高亮重绘制内容
    // 以彩虹色谱循环的颜色，有利于你找到应用中频繁重绘导致性能消耗过大的部分
    // debugRepaintRainbowEnabled = true;

    // 高亮尺寸过大的图片
    // 该选项会将尺寸过大的图片高亮表示，并且进行垂直翻转及色调反转
    debugInvertOversizedImages = true;
  }
}
