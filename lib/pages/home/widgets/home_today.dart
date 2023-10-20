import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:yaoji/common/constant.dart';
// import 'package:go_router/go_router.dart';

import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:yaoji/common/notification/notifcation.dart';

final class HomeTodayWidget extends StatelessWidget {
  final HistoryItem todayItem;

  const HomeTodayWidget({
    super.key,
    required this.todayItem,
  });

  _gotoPerson(BuildContext context) {
    YJTabarNotification(tabbarIndex: 3).dispatch(context);
    // gotoLoushiPage();

    // 页面跳转如下：
    /*
    // 官方demo查看：https://github.com/flutter/packages/tree/main/packages/go_router
    // 使用 go 进行跳转，支持带入101的参数
    // context.go(
    //   "/pages/home/loushi/101",
    //   extra: {"eid": "201"},
    // );

    // context.push(Uri(path: "/pages/home/loushi/101", queryParameters: {
    //   "qid": "301",
    // }).toString());

    // 使用gotNamed跳转
    // context.goNamed(
    //   "loushi_",
    //   pathParameters: {"pid": "100"},
    // );
    // 页面跳转如上
    */
  }

  Widget _titleWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "今日推荐",
          style: TextStyle(
            color: Colors.black,
            fontSize: YJConstant.titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            _gotoPerson(context);
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }

  Widget _contentWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: YJConstant.borderRadius,
      ),
      // clipsToBounds 相似能力
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(top: YJConstant.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: todayItem.coverImg ?? "",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(YJConstant.padding),
            child: Text(
              todayItem.title ?? "",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: YJConstant.padding,
              right: YJConstant.padding,
              bottom: YJConstant.padding,
            ),
            child: Text(
              todayItem.brief ?? "",
              style: TextStyle(
                fontSize: YJConstant.contentFontSize,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _contentActionView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/pages/detail/${todayItem.id}");
      },
      child: _contentWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: YJConstant.padding,
        bottom: YJConstant.padding,
      ),
      padding: EdgeInsets.only(
        left: YJConstant.padding,
        right: YJConstant.padding,
      ),
      child: Column(
        children: [
          _titleWidget(context),
          _contentActionView(context),
        ],
      ),
    );
  }
}
