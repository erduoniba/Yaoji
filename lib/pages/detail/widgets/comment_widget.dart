import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/common/constant.dart';
import 'package:yaoji/common/widgets/list_header.dart';
import 'package:yaoji/pages/detail/models/comment_model.dart';
import 'package:yaoji/pages/detail/requests/detail_request.dart';
import 'package:yaoji/pages/yaobo/widgets/yaobo_list.dart';

final class CommentListWidget extends StatefulWidget {
  final int id;
  const CommentListWidget(this.id, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CommentListState();
  }
}

final class _CommentListState extends State<CommentListWidget> {
  late int id;
  late EasyRefreshController _controller;
  late List<YJCommentItem> _list = [];
  late int _pageNum = 1;
  late final int _pageSize = 10;
  late int _total = 0;

  late bool _haveMore = true;

  @override
  void initState() {
    super.initState();
    id = widget.id;

    _controller = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: false,
    );

    _refreshData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _extensionSetstate(Function() callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: YJConstant.padding),
      child: Column(
        children: [
          _listwidget(),
          _moreWidget(),
        ],
      ),
    );
  }

  Widget _listwidget() {
    return Column(
      children: [
        _titleWidget(),
        ListView.builder(
          itemBuilder: (content, index) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: _commentItemWidget(_list[index]),
            );
          },
          itemCount: _list.length,
          /*
          当shrinkWrap设置为true时，可滚动小部件将根据其内容的大小来调整自身的尺寸，
          即尽可能小地包裹其内容。这意味着，如果内容不足以填充整个可滚动小部件的视图区域，
          那么可滚动小部件将会收缩到与内容一样的大小。
          */
          shrinkWrap: true,
          // NeverScrollableScrollPhysics：禁止滚动。
          physics: const NeverScrollableScrollPhysics(),
        )
      ],
    );
  }

  Widget _titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "评论",
          style: TextStyle(fontSize: YJConstant.contentFontSize),
        ),
        Text(
          "共$_total条评论",
          style: TextStyle(
              fontSize: YJConstant.tipFontSize, color: YJColor.tipColor()),
        )
      ],
    );
  }

  Widget _commentItemWidget(YJCommentItem item) {
    return Row(
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
        SizedBox(width: YJConstant.padding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name ?? "",
              style: TextStyle(
                fontSize: YJConstant.contentFontSize,
                color: YJColor.themeColor(),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: Text(
                item.content ?? "",
                style: TextStyle(
                  fontSize: YJConstant.contentFontSize,
                  color: YJColor.contentColor(),
                ),
              ),
            ),
            _replyCommentWidget(item),
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.timeHour ?? "",
                    style: TextStyle(
                      fontSize: YJConstant.contentFontSize,
                      color: YJColor.tipColor(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint("你点击了回复");
                    },
                    child: Text(
                      "回复",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: YJConstant.contentFontSize,
                        color: YJColor.themeColor(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _replyCommentWidget(YJCommentItem item) {
    if (item.items != null && item.items!.isEmpty) {
      return const SizedBox();
    }
    List<Container> ritems = [];
    for (YJCommentItem ritem in item.items!) {
      RichText text = RichText(
        text: TextSpan(
          text: ritem.receiverName ?? "",
          style: TextStyle(
            fontSize: YJConstant.contentFontSize,
            color: YJColor.tipColor(),
          ),
          children: <TextSpan>[
            TextSpan(
              text: "回复",
              style: TextStyle(
                fontSize: YJConstant.contentFontSize,
                color: YJColor.contentColor(),
              ),
            ),
            TextSpan(
              text: ritem.name ?? "",
              style: TextStyle(
                fontSize: YJConstant.contentFontSize,
                color: YJColor.tipColor(),
              ),
            ),
            TextSpan(
              text: ritem.content ?? "",
              style: TextStyle(
                fontSize: YJConstant.contentFontSize,
                color: YJColor.contentColor(),
              ),
            ),
          ],
        ),
      );
      Container contain = Container(
        padding: const EdgeInsets.all(4),
        child: text,
      );
      ritems.add(contain);
    }
    return Container(
      width: MediaQuery.of(context).size.width - 88,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: YJColor.backgroundColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ritems,
      ),
    );
  }

  Widget _moreWidget() {
    if (!_haveMore) {
      return const SizedBox();
    }
    return SizedBox(
        height: 50,
        child: GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "查看更多评论",
                style: TextStyle(fontSize: YJConstant.contentFontSize),
              ),
              const Icon(Icons.keyboard_arrow_down_sharp),
            ],
          ),
          onTap: () {
            _loadMoreData();
          },
        ));
  }
}

extension _CommentListStateRequest on _CommentListState {
  _refreshData() {
    _pageNum = 1;
    DetailData.getComment(id, _pageNum, _pageSize, _total).then((res) {
      if (res is YJCommentModel && res.list != null && res.list!.isNotEmpty) {
        if (res.total != null) {
          _total = res.total!;
        }
        _extensionSetstate(() {
          _list = res.list!;
          if (_list.length >= _total) {
            _haveMore = false;
          }
        });
      }
    });
  }

  _loadMoreData() {
    _pageNum++;
    DetailData.getComment(id, _pageNum, _pageSize, _total).then((res) {
      if (res is YJCommentModel && res.list != null && res.list!.isNotEmpty) {
        if (res.total != null) {
          _total = res.total!;
        }
        _extensionSetstate(() {
          _list.addAll(res.list!);
        });
        if (_list.length >= _total) {
          _extensionSetstate(() => _haveMore = false);
        }
        if (res.list!.length < _pageSize) {
          _controller.finishLoad(IndicatorResult.noMore);
        } else {
          _controller.finishLoad(IndicatorResult.success);
        }
      } else {
        _controller.finishLoad(IndicatorResult.noMore);
      }
    });
  }
}
