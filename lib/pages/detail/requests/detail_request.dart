import 'package:yaoji/common/net/api.dart';
import 'package:yaoji/pages/detail/models/detail_model.dart';
import 'package:yaoji/pages/detail/models/comment_model.dart';

class DetailData {
  static getDetail(int id) async {
    final params = {"id": id};
    final response = await httpManager.netFetch(
      "article/detail",
      params,
      null,
    );
    Map data = response?.data;
    // ignore: unnecessary_type_check
    if (data is Map == false) {
      return null;
    }
    Map<String, dynamic> realData = data['data'];
    // ignore: unnecessary_type_check
    if (realData is Map == false) {
      return null;
    }

    final ProductItem item = ProductItem.fromJson(realData);
    return item;
  }

  static getComment(int id, int pageNum, int pageSzie, int total) async {
    final params = {
      "id": id,
      "page_num": pageNum,
      "page_size": pageSzie,
      "total": total
    };
    final response = await httpManager.netFetch(
      "article/comment/search",
      params,
      null,
    );
    Map data = response?.data;
    // ignore: unnecessary_type_check
    if (data is Map == false) {
      return null;
    }
    Map<String, dynamic> realData = data['data'];
    // ignore: unnecessary_type_check
    if (realData is Map == false) {
      return null;
    }

    final YJCommentModel item = YJCommentModel.fromJson(realData);
    return item;
  }
}
