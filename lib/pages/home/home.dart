import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:yaoji/common/widgets/list_header.dart';
import 'package:yaoji/common/widgets/list_header.dart';

class YJHomePage extends StatefulWidget {
  const YJHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _YJHomePageState();
}

class _YJHomePageState extends State<YJHomePage> {
  int _count = 10;
  late EasyRefreshController _controller;

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
      body: EasyRefresh(
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
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1));
          if (!mounted) {
            return;
          }
          setState(() {
            _count += 6;
          });
          if (_count > 20) {
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
      ),
    );
  }
}
