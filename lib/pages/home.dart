import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';

class YJHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YJHomePageState();
}

class _YJHomePageState extends State {
  @override
  Widget build(Object context) {
    return Container(
      color: YJColor.randomColor(),
    );
  }
}
