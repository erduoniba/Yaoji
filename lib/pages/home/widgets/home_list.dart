import 'package:flutter/material.dart';
import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

final class HomeHistoryView extends StatelessWidget {
  final HistoryItem historyItem;
  const HomeHistoryView({super.key, required this.historyItem});

  Widget _dateWidget() {
    if (historyItem.showDate == null || historyItem.showDate!.isEmpty) {
      return Container(
        height: 0,
      );
    }
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 12),
      alignment: Alignment.centerLeft,
      child: Text(
        historyItem.showDate!,
        style: TextStyle(color: Colors.grey[500]),
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  historyItem.title ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Expanded(child: Container()),
                Text(
                  historyItem.brief ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: historyItem.coverImg ?? "",
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _badgeWidget() {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      child: Text(
        "百妖",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue[800], fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          _dateWidget(),
          Stack(
            children: [
              _contentWidget(context),
              Positioned(
                top: 0,
                right: 0,
                child: _badgeWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
