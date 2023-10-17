import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import 'package:yaoji/pages/home/models/home_model.dart';

final class HomeTodayWidget extends StatelessWidget {
  final HistoryItem todayItem;

  const HomeTodayWidget({
    super.key,
    required this.todayItem,
  });

  _gotoPerson(BuildContext context) {
    context.go(Uri(
      path: "/pages/home/pages/loushi",
      queryParameters: {"id": "100"},
    ).toString());
  }

  Widget _titleWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "今日推荐",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
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
        borderRadius: BorderRadius.circular(10),
      ),
      // clipsToBounds 相似能力
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 16),
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
            padding: const EdgeInsets.all(16),
            child: Text(
              todayItem.title ?? "",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              todayItem.brief ?? "",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          _titleWidget(context),
          _contentWidget(),
        ],
      ),
    );
  }
}
