import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/common/constant.dart';
import 'package:yaoji/pages/detail/models/comment_model.dart';

class AllCommentWidget extends StatelessWidget {
  final List<YJCommentItem> _list;
  final double _contentHeight;
  const AllCommentWidget(this._list, this._contentHeight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _contentHeight - 10,
      padding: EdgeInsets.fromLTRB(
        YJConstant.padding,
        YJConstant.padding,
        YJConstant.padding,
        MediaQuery.of(context).padding.bottom,
      ),
      child: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: _commentListItem(context, _list[index]),
            );
          },
          itemCount: _list.length,
          shrinkWrap: true,
        ),
      ),
    );
  }

  Widget _commentListItem(BuildContext context, YJCommentItem item) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: item.avatar ?? "",
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            width: YJConstant.padding,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.name} 回复 ${item.receiverName}",
                  style: TextStyle(color: YJColor.themeColor()),
                ),
                const SizedBox(height: 4),
                Text(item.content ?? ""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.timeHour ?? "",
                      style: TextStyle(
                        color: YJColor.tipColor(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        debugPrint("点击回复");
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "回复",
                          style: TextStyle(
                            color: YJColor.themeColor(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
