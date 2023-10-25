import 'package:yaoji/common/net/api.dart';
import 'package:yaoji/pages/home/models/home_model.dart';

class ArticleRequest {
  static getArticleData(String bookName, {int pageNum = 1}) async {
    final params = {
      "page_num": pageNum,
      "page_size": 10,
      "book_name": bookName
    };
    final response = await httpManager.netFetch("article/search", params, null);
    if (response?.result == false) {
      return null;
    }

    Map data = response?.data;

    Map<String, dynamic> list = data["data"];
    final model = HistoryModel.fromJson(list);
    return model;
  }
}
