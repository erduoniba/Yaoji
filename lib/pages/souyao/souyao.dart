import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaoji/common/constant.dart';

class YJSouyaoPage extends StatefulWidget {
  const YJSouyaoPage({super.key});
  @override
  State<StatefulWidget> createState() => _YJSouyaoPageState();
}

class _YJSouyaoPageState extends State {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local!.souyao,
          style: TextStyle(fontSize: YJConstant.titleFontSize),
        ),
      ),
      body: Container(
        color: YJColor.randomColor(),
      ),
    );
  }
}
