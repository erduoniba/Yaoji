import 'package:yaoji/common/net/api.dart';
import 'package:yaoji/pages/home/models/home_model.dart';

class HomeData {
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

  static getHomeListData({int pageNum = 1}) async {
    final params = {"page_size": 10, "page_num": pageNum};
    final response = await httpManager.netFetch("home/history", params, null);
    if (response?.result == false) {
      return null;
    }

    Map data = response?.data;
    // ignore: unnecessary_type_check
    if (data is Map == false) {
      return null;
    }
    Map<String, dynamic> listData = data['data'];
    // ignore: unnecessary_type_check
    if (listData is Map == false) {
      return null;
    }
    final model = HistoryModel.fromJson(listData);
    return model;
  }
}
