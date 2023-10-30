import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaoji/common/constant.dart';
import 'package:yaoji/pages/example.dart';

class YJLoushiPage extends StatefulWidget {
  const YJLoushiPage({super.key, required this.id});
  final String? id;
  @override
  State<StatefulWidget> createState() => _YJLoushiPageState();
}

class _YJLoushiPageState extends State<YJLoushiPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local!.loushi,
          style: TextStyle(fontSize: YJConstant.titleFontSize),
        ),
      ),
      body: Container(
        color: YJColor.randomColor(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ExampleWidget();
          }));
        },
        child: const Text("Action"),
      ),
    );
  }
}
