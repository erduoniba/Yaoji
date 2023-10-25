import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/common/constant.dart';
import 'package:yaoji/common/widgets/list_header.dart';
import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:yaoji/pages/home/widgets/home_list.dart';
import 'request/article_request.dart';

final class YJArticleList extends StatefulWidget {
  final String bookName;

  const YJArticleList(this.bookName, {super.key});

  @override
  State<StatefulWidget> createState() => _YJArticleListState();
}

class _YJArticleListState extends State<YJArticleList> {
  late int _pageNum = 1;
  late String _bookName;
  late bool _loading = true;
  late bool _moreData = true;
  late List<HistoryItem> _list;
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();

    _bookName = widget.bookName;
    _list = [];
    _controller = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
    _refreshData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _bookName,
          style: TextStyle(fontSize: YJConstant.titleFontSize),
        ),
      ),
      body: Skeletonizer(
        enabled: _loading,
        child: _articleListWidget(),
      ),
      backgroundColor: YJColor.backgroundColor(),
    );
  }

  Widget _articleListWidget() {
    return EasyRefresh(
      controller: _controller,
      header: YJListHeader.listHeader(),
      footer: YJListHeader.listFooter(),
      onRefresh: () async {
        _refreshData();
      },
      onLoad: () async {
        if (_moreData) {
          _loadMoreData();
        } else {
          _controller.finishLoad(IndicatorResult.noMore);
        }
      },
      child: Scrollbar(
        child: ListView.builder(
          padding: EdgeInsets.only(top: YJConstant.padding),
          itemBuilder: (context, index) {
            return HomeHistoryView(historyItem: _list[index]);
          },
          itemCount: _list.length,
        ),
      ),
    );
  }

  extensionSetstate(Function() callback) {
    setState(() {
      callback();
    });
  }
}

extension _YJArticleListStateRequest on _YJArticleListState {
  _refreshData() {
    extensionSetstate(() => _loading = true);

    _pageNum = 1;
    ArticleRequest.getArticleData(_bookName).then((res) {
      _controller.finishRefresh();
      if (res is HistoryModel) {
        debugPrint(res.description());
        if (res.list.isNotEmpty) {
          _combineData(res.list, refresh: true);
        } else {
          _moreData = false;
          _controller.finishLoad(IndicatorResult.noMore);
        }
      }
    });
  }

  _loadMoreData() {
    _pageNum++;
    ArticleRequest.getArticleData(_bookName, pageNum: _pageNum).then((res) {
      if (res is HistoryModel) {
        if (res.list.isNotEmpty) {
          _combineData(res.list, refresh: false);
        } else {
          _controller.finishLoad(IndicatorResult.noMore);
        }
      }
    });
  }

  _combineData(List<HistoryItem> list, {bool refresh = false}) {
    List<HistoryItem> tempList = _list;
    if (refresh) {
      tempList = list;
    } else {
      tempList.addAll(list);
    }
    extensionSetstate(() {
      _loading = false;
      _list = tempList;
    });
    if (list.length < 10) {
      _moreData = false;
      _controller.finishLoad(IndicatorResult.noMore);
    } else {
      _moreData = true;
      _controller.finishLoad(IndicatorResult.success);
    }
  }
}
