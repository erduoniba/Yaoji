import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaoji/common/constant.dart';

class YJYaoboPage extends StatefulWidget {
  const YJYaoboPage({super.key});
  @override
  State<StatefulWidget> createState() => _YJYaoboPageState();
}

class _YJYaoboPageState extends State {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local!.yaobo,
          style: TextStyle(fontSize: YJConstant.titleFontSize),
        ),
      ),
      body: Container(
        color: YJColor.randomColor(),
      ),
    );
  }
}
