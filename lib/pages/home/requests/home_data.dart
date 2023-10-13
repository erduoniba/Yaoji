import 'package:flutter/material.dart';
import 'package:yaoji/common/net/api.dart';
import 'package:yaoji/pages/home/models/home_model.dart';

class HomeData {
  // 网络异常 The connection errored: Failed host lookup
  // 解决方案：
  // 1、尝试重启VSCode、删除App重新运行；
  // 2、手机重启网络
  static getHomeAdvData() async {
    final params = {"page_size": 10, "page_num": 1};

    final response = await httpManager.netFetch("home/adv", params, null);
    if (response?.result == false) {
      return null;
    }

    Map data = response?.data;
    // ignore: unnecessary_type_check
    if (data is Map == false) {
      return null;
    }
    Map<String, dynamic> advData = data['data'];
    // ignore: unnecessary_type_check
    if (advData is Map == false) {
      return null;
    }
    final model = AdvModel.fromJson(advData);
    return model;
  }
}
