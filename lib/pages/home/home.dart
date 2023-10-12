import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YJHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YJHomePageState();
}

class _YJHomePageState extends State {
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
      body: Container(
        color: YJColor.randomColor(),
      ),
    );
  }
}
