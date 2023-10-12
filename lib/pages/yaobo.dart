import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';

class YJYaoboPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YJYaoboPageState();
}

class _YJYaoboPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: YJColor.randomColor(),
    );
  }
}
