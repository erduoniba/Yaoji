import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:yaoji/common/widgets/list_header.dart';
import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:yaoji/pages/home/requests/home_request.dart';

class YJHomePage extends StatefulWidget {
  const YJHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _YJHomePageState();
}

class _YJHomePageState extends State<YJHomePage> {
  int _count = 10;
  late EasyRefreshController _controller;
  late AdvModel _advModel;
  late List<HistoryItem> _list = [];
  late int _pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _refreshData() {
    _pageNum = 1;
    HomeData.getHomeAdvData().then((res) {
      if (res is AdvModel) {
        _advModel = res;
      }
    });
    HomeData.getHomeListData().then((res) {
      if (res is HistoryModel) {
        _list = res.list;
        debugPrint(res.description());
      }
    });
  }

  _loadMoreData() {
    _pageNum++;
    HomeData.getHomeListData(page_num: _pageNum).then((res) {
      if (res is HistoryModel) {
        debugPrint(res.description());
        _list.addAll(res.list);
      }
    });
  }

  Widget _homeListView() {
    return EasyRefresh(
      controller: _controller,
      header: YJListHeader.listHeader(),
      footer: YJListHeader.listFooter(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        if (!mounted) {
          return;
        }
        setState(() {
          _count = 10;
        });
        _controller.finishRefresh();
        _controller.resetFooter();

        _refreshData();
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 1));
        if (!mounted) {
          return;
        }
        _loadMoreData();

        setState(() {
          _count += 6;
        });
        if (_list.length > 100) {
          _controller.finishLoad(IndicatorResult.noMore);
        } else {
          _controller.finishLoad(IndicatorResult.success);
        }
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              alignment: Alignment.center,
              height: 80,
              child: Text('index: ($index + 1)'),
            ),
          );
        },
        itemCount: _count,
      ),
    );
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
    );
  }

  Widget testView() {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        child: const Text('request'),
        onPressed: () {
          _refreshData();
        },
      ),
    );
  }
}
