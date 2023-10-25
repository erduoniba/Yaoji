import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaoji/common/constant.dart';
import 'widgets/yaobo_list.dart';

class YJYaoboPage extends StatefulWidget {
  const YJYaoboPage({super.key});
  @override
  State<StatefulWidget> createState() => _YJYaoboPageState();
}

class _YJYaoboPageState extends State {
  final List<YJYaoboItem> _list = [];

  @override
  void initState() {
    super.initState();

    YJYaoboItem item = YJYaoboItem("百妖", "妖怪百科全书", "image", 4);
    _list.add(item);

    item = YJYaoboItem("杂谈", "妖怪研究所", "image", 2);
    _list.add(item);

    item = YJYaoboItem("夜谭", "妖怪的同人创作", "image", 3);
    _list.add(item);
  }

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
        color: YJColor.backgroundColor(),
        padding: EdgeInsets.all(YJConstant.padding),
        child: _bookListWidget(),
      ),
    );
  }

  Widget _bookListWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {
        YJYaoboItem item = _list[index];
        return YJYaoboListItemWidget(item);
      },
      itemCount: _list.length,
    );
  }
}
