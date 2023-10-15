import 'package:flutter/material.dart';
import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTodayWidget extends StatelessWidget {
  late HistoryItem todayItem;

  HomeTodayWidget({super.key, required this.todayItem});

  Widget _titleWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "今日推荐",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.person),
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
          _titleWidget(),
          _contentWidget(),
        ],
      ),
    );
  }
}
