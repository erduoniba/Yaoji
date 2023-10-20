import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yaoji/pages/detail/models/detail_model.dart';
import 'package:yaoji/pages/detail/requests/detail_request.dart';
import 'widgets/book_widget.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/common/constant.dart';

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
  ProductItem? _item;
  late bool _showTranslate = true;

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
          _item = item;
          if (!(_item == null ||
              _item?.author == null ||
              _item?.author == "")) {
            _title = item.author!;
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
          style: TextStyle(fontSize: YJConstant.titleFontSize),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: YJConstant.padding,
          right: YJConstant.padding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerWidget(),
              _contentImgWidget(),
              Html(data: _data),
              _bookTitleWidget(),
              _bookDetailsWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    double height = 80;
    Widget authorWidget;
    if (_item == null || _item?.author == null || _item?.author == "") {
      height = 60;
      authorWidget = const SizedBox();
    } else {
      authorWidget = Text(
        "作者：${_item?.author}",
        style: TextStyle(
          fontSize: YJConstant.contentFontSize,
          color: YJColor.tipColor(),
        ),
      );
    }
    return Container(
      height: height,
      padding: EdgeInsets.only(left: 10, bottom: YJConstant.padding),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _item?.title ?? "",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: YJConstant.bigTitleFontSize,
              fontWeight: FontWeight.w600,
              color: YJColor.titleColor(),
            ),
          ),
          Expanded(child: Container()),
          authorWidget,
        ],
      ),
    );
  }

  Widget _contentImgWidget() {
    if (_item != null &&
        _item!.contentImg != null &&
        _item!.contentImg!.isNotEmpty) {
      return Stack(
        children: [
          CachedNetworkImage(
            imageUrl: _item!.contentImg!,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: YJConstant.padding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black45,
              ),
              child: Text(
                "${_item?.author ?? "纪妖"}@${_item?.picAuthor ?? ""}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      );
    }
    return Container();
  }

  Widget _translateButton() {
    bool show = false;
    for (Book book in _item!.books) {
      if (book.origin != null && book.translate!.isNotEmpty) {
        show = true;
        break;
      }
    }
    if (show) {
      return TextButton(
        child: Text(
          textAlign: TextAlign.right,
          _showTranslate ? "关闭译文" : "打开译文",
          style: TextStyle(
            fontSize: 12,
            color: YJColor.themeColor(),
          ),
        ),
        onPressed: () {
          setState(() {
            _showTranslate = !_showTranslate;
          });
        },
      );
    }
    return Container();
  }

  Widget _bookTitleWidget() {
    if (_item != null && _item!.books.isNotEmpty) {
      return Container(
        padding: EdgeInsets.only(left: 10, top: YJConstant.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "相关文献",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: YJConstant.detailFontSize,
              ),
            ),
            _translateButton(),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _bookDetailsWidget() {
    if (_item != null && _item!.books.isNotEmpty) {
      List<Widget> widgets = [];
      for (Book book in _item!.books) {
        widgets.add(BookWidget(book, _showTranslate));
      }
      return Column(children: widgets);
    }
    return Container();
  }
}
