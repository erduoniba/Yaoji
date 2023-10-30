import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaoji/common/colors.dart';

class ExampleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleWidgetState();
  }
}

class _ExampleWidgetState extends State<ExampleWidget> {
  // 获取原生模块的数据信息
  static const platform = MethodChannel("samples.flutter.dev/battery");
  String _batteryLevel = "Unknow battery level.";

  // 获取原生模块的View
  final String viewType = "platform-view-example";
  final Map<String, dynamic> createParams = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: _contentWidget(),
    );
  }

  Widget _contentWidget() {
    return Container(
      color: YJColor.backgroundColor(),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TextButton(
                onPressed: _getBatteryLevel, child: Text(_batteryLevel)),
          ),
          SizedBox(
            height: 100,
            child: UiKitView(
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: createParams,
              creationParamsCodec: const StandardMessageCodec(),
            ),
          )
        ],
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
