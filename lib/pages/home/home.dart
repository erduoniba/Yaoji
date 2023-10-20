import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yaoji/common/constant.dart';

import 'package:yaoji/common/widgets/list_header.dart';
import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:yaoji/pages/home/requests/home_request.dart';
import 'package:yaoji/pages/home/widgets/home_adview.dart';
import 'package:yaoji/pages/home/widgets/home_today.dart';
import 'package:yaoji/pages/home/widgets/home_list.dart';

class YJHomePage extends StatefulWidget {
  const YJHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _YJHomePageState();
}

class _YJHomePageState extends State<YJHomePage> {
  late EasyRefreshController _controller;
  late AdvModel _advModel = AdvModel([]);
  late List<HistoryItem> _list = [];
  late int _pageNum = 1;
  // 最后一条数据的归属日期，用于列表按照同一天进行展示
  late String _lastDate = "";
  late bool _loading = true;

  @override
  void initState() {
    super.initState();
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

  // 回调函数：将方法作为参数进行传递，然后执行
  void extensionSetState(Function() callback) {
    setState(callback);
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local!.home,
          style: TextStyle(fontSize: YJConstant.titleFontSize),
        ),
      ),
      body: Skeletonizer(
        enabled: _loading,
        child: _homeListView(),
      ),
      // body: _homeListView(),
      backgroundColor: Colors.grey[200],
    );
  }
}

extension _YJHomePageStateRequest on _YJHomePageState {
  _refreshData() {
    extensionSetState(() {
      _loading = true;
    });
    _pageNum = 1;
    _list.clear();
    HomeData.getHomeAdvData().then((res) {
      if ((res is AdvModel) &&
          res.list.isNotEmpty &&
          res.list.first.coverImg != null) {
        extensionSetState(() {
          _loading = false;
          _advModel = res;
        });
        _controller.finishRefresh();
      }
    });

    HomeData.getHomeListData().then((res) {
      if (res is HistoryModel) {
        _combineData(res.list, refresh: true);
        _controller.finishRefresh();
        _controller.resetFooter();
      }
    });
  }

  _loadMoreData() {
    _pageNum++;
    HomeData.getHomeListData(pageNum: _pageNum).then((res) {
      if (res is HistoryModel) {
        debugPrint(res.description());
        _combineData(res.list, refresh: false);
        if (res.list.length < 10) {
          _controller.finishLoad(IndicatorResult.noMore);
        } else {
          _controller.finishLoad(IndicatorResult.success);
        }
      }
    });
  }

  _combineData(List<HistoryItem> list, {bool refresh = false}) {
    // 少于两条数据，并且是刷新情况下，直接作为今日推荐数据
    if (list.length < 2 && refresh) {
      extensionSetState(() => _list = list);
      return;
    }

    if (refresh) {
      _list.clear();
    }
    List<HistoryItem> tempList = _list;
    for (int i = 0; i < list.length; i++) {
      HistoryItem item = list[i];
      if (refresh && i == 0) {
        // 下拉刷新，第一条数据被今日推荐使用
        tempList.add(item);
        continue;
      }

      if (item.dateNormal != _lastDate) {
        item.showDate = item.dateNormal;
        _lastDate = item.dateNormal ?? "";
      }
      tempList.add(item);
    }
    extensionSetState(() {
      _list = tempList;
    });
  }
}

extension _YJHomePageStateView on _YJHomePageState {
  Widget _homeListView() {
    return EasyRefresh(
      controller: _controller,
      header: YJListHeader.listHeader(),
      footer: YJListHeader.listFooter(),
      onRefresh: () async {
        _refreshData();
      },
      onLoad: () async {
        _loadMoreData();
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0 && _advModel.list.isNotEmpty) {
            return HomeAdvView(advModel: _advModel);
          } else if (index == 1) {
            return HomeTodayWidget(todayItem: _list.first);
          }

          if (_advModel.list.isNotEmpty) {
            return HomeHistoryView(historyItem: _list[index - 1]);
          }
          return HomeHistoryView(historyItem: _list[index]);
        },
        itemCount: itemCount(),
      ),
    );
  }

  int itemCount() {
    int count = _list.length;
    if (_advModel.list.isNotEmpty) {
      count++;
    }
    return count;
  }
}
