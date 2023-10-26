import 'package:yaoji/common/net/api.dart';
import 'package:yaoji/pages/home/models/home_model.dart';

class ArticleRequest {
  static getArticleData(String? bookName, int? category,
      {int pageNum = 1}) async {
    Map<String, dynamic> params = {"page_num": pageNum, "page_size": 10};
    if (bookName != null && bookName.isNotEmpty) {
      params["book_name"] = bookName;
    }
    if (category != null && category > 0) {
      params["category"] = category;
    }
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
