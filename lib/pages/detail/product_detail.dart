import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yaoji/pages/detail/models/detail_model.dart';
import 'package:yaoji/pages/detail/requests/detail_request.dart';

final class YJProductDetailPage extends StatefulWidget {
  final int id;
  const YJProductDetailPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return _YJProductDetailState();
  }
}

final class _YJProductDetailState extends State<YJProductDetailPage> {
  late String? _data = "<p>";
  late String _title = "妖记";

  @override
  void initState() {
    super.initState();

    _requestData();
  }

  _requestData() {
    EasyLoading.show();
    DetailData.getDetail(widget.id).then((item) {
      if (item is ProductItem) {
        setState(() {
          _data = item.content;
          if (item.title != null) {
            _title = item.title!;
          }
        });
      }
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: SingleChildScrollView(
          child: Html(
            data: _data,
          ),
        ),
      ),
    );
  }
}
