import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';

class YJLoushiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YJLoushiPageState();
}

class _YJLoushiPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: YJColor.randomColor(),
    );
  }
}
