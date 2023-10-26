import 'package:flutter/material.dart';
import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:yaoji/common/constant.dart';

final class HomeHistoryView extends StatelessWidget {
  final HistoryItem historyItem;
  const HomeHistoryView({super.key, required this.historyItem});

  Widget _dateWidget() {
    if (historyItem.showDate == null || historyItem.showDate!.isEmpty) {
      return Container();
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
        borderRadius: YJConstant.borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.fromLTRB(
        YJConstant.padding,
        YJConstant.padding,
        10,
        YJConstant.padding,
      ),
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
            imageUrl: _coverImg(),
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  String _coverImg() {
    if (historyItem.coverImg != null && historyItem.coverImg!.isNotEmpty) {
      return historyItem.coverImg!;
    }
    return YJConstant.defaultImg;
  }

  Widget _contentActionWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/pages/detail/${historyItem.id}");
      },
      child: _contentWidget(context),
    );
  }

  Widget _badgeWidget() {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.only(
          bottomLeft: YJConstant.radius,
          topRight: YJConstant.radius,
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
      margin: EdgeInsets.only(bottom: YJConstant.padding),
      padding:
          EdgeInsets.only(left: YJConstant.padding, right: YJConstant.padding),
      child: Column(
        children: [
          _dateWidget(),
          Stack(
            children: [
              _contentActionWidget(context),
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
