import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class YJListHeader {
  static ClassicHeader listHeader() {
    return const ClassicHeader(
      showText: false,
    );
  }

  static ClassicFooter listFooter() {
    return const ClassicFooter(
      showText: false,
      showMessage: false,
      noMoreIcon: Icon(null),
    );
  }
}
