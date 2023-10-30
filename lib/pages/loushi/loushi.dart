import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaoji/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaoji/common/constant.dart';

class YJLoushiPage extends StatefulWidget {
  const YJLoushiPage({super.key, required this.id});
  final String? id;
  @override
  State<StatefulWidget> createState() => _YJLoushiPageState();
}

class _YJLoushiPageState extends State<YJLoushiPage> {
  static const platform = MethodChannel("samples.flutter.dev/battery");
  String _batteryLevel = "Unknow battery level.";

  @override
  void initState() {
    super.initState();
    debugPrint("personid: ${widget.id}");
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
        onPressed: _getBatteryLevel,
        child: Text(_batteryLevel),
      ),
    );
  }

  Future _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = "Battery level is $result % .";
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
