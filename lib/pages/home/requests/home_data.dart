import 'package:flutter/material.dart';
import 'package:yaoji/common/net/api.dart';

class HomeData {
  static getHomeAdvData() async {
    final params = {"page_size": 10, "page_num": 1};
    final response2 = await httpManager.netFetch("home/adv", params, null);
    debugPrint('getHomeAdvData: ${response2?.data}');
  }
}
