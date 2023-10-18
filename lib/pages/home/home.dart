import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:yaoji/common/widgets/list_header.dart';
import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:yaoji/pages/home/requests/home_request.dart';
import 'package:yaoji/pages/home/widgets/home_adview.dart';
import 'package:yaoji/pages/home/widgets/home_today.dart';

class YJHomePage extends StatefulWidget {
  const YJHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _YJHomePageState();
}

class _YJHomePageState extends State<YJHomePage> {
  late EasyRefreshController _controller;
  late String _advImgUrl;
  late List<HistoryItem> _list = [];
  late int _pageNum = 1;

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
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      // body: homeListView(),
      body: _homeListView(),
      backgroundColor: Colors.grey[200],
    );
  }
}

extension _YJHomePageStateRequest on _YJHomePageState {
  _refreshData() {
    _pageNum = 1;
    _list.clear();
    _advImgUrl = "";
    HomeData.getHomeAdvData().then((res) {
      if ((res is AdvModel) &&
          res.list.isNotEmpty &&
          res.list.first.coverImg != null) {
        extensionSetState(() {
          _advImgUrl = res.list.first.coverImg!;
        });
        _controller.finishRefresh();
      }
    });
    HomeData.getHomeListData().then((res) {
      if (res is HistoryModel) {
        extensionSetState(() {
          _list = res.list;
        });
        _controller.finishRefresh();
        _controller.resetFooter();
        debugPrint(res.description());
      }
    });
  }

  _loadMoreData() {
    _pageNum++;
    HomeData.getHomeListData(pageNum: _pageNum).then((res) {
      if (res is HistoryModel) {
        debugPrint(res.description());
        extensionSetState(() {
          _list.addAll(res.list);
        });
        if (res.list.length < 10) {
          _controller.finishLoad(IndicatorResult.noMore);
        } else {
          _controller.finishLoad(IndicatorResult.success);
        }
      }
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
          if (index == 0 && _advImgUrl.isNotEmpty) {
            return HomeAdvView(imgUrl: _advImgUrl);
          } else if (index == 1) {
            return HomeTodayWidget(
              todayItem: _list.first,
            );
          }
          return Card(
            child: Container(
              alignment: Alignment.center,
              height: 80,
              child: Text('index: ($index + 1)'),
            ),
          );
        },
        itemCount: _list.length,
      ),
    );
  }
}
