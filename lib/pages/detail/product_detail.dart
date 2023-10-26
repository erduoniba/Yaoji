import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yaoji/pages/detail/models/detail_model.dart';
import 'package:yaoji/pages/detail/requests/detail_request.dart';
import 'package:yaoji/pages/detail/widgets/comment_widget.dart';
import 'widgets/book_widget.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/common/constant.dart';
import 'package:yaoji/pages/detail/widgets/bottom_widget.dart';

final class YJProductDetailPage extends StatefulWidget {
  final int id;
  const YJProductDetailPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _YJProductDetailState();
}

final class _YJProductDetailState extends State<YJProductDetailPage> {
  late String? _data = "<p>";
  late String _title = "妖记";
  ProductItem? _item;
  late int id;
  late bool _showTranslate = true;

  final FocusNode _focusNode = FocusNode();

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // TextField获取焦点时，显示键盘
    } else {
      // TextField失去焦点时，隐藏键盘
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    id = widget.id;
    _focusNode.addListener(_onFocusChange);

    _requestData();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  _requestData() {
    EasyLoading.show();
    DetailData.getDetail(id).then((item) {
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
      body: GestureDetector(
        onTap: () {
          // 点击除TextField外的其他区域时，隐藏键盘
          FocusScope.of(context).unfocus();
        },
        child: _bodyScrolllWidget(),
      ),
    );
  }

  Widget _bodyScrolllWidget() {
    return Scrollbar(child: _bodyWidget());
  }

  Widget _bodyWidget() {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        left: YJConstant.padding,
        right: YJConstant.padding,
      ),
      color: Colors.white,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  _headerWidget(),
                  _contentImgWidget(),
                  Html(data: _data),
                  _bookTitleWidget(),
                  _bookDetailsWidget(),
                  _dateWidget(),
                  _tagsWidget(),
                  Divider(height: 1, color: YJColor.lineColor()),
                  _commetWidget(),
                ],
              ),
            ),
          ),
          Container(),
          _bottomFuncWidget(),
          _nextButtonWidget(),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    double height = 120;
    Widget authorWidget;
    if (_item == null || _item?.author == null || _item?.author == "") {
      height = 80;
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
          const Expanded(child: SizedBox()),
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
                style: const TextStyle(color: Colors.white),
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

  Widget _dateWidget() {
    if (_item == null || _item!.date == null) {
      return Container();
    }
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        _item!.date ?? "",
        style: TextStyle(color: YJColor.tipColor()),
      ),
    );
  }

  Widget _tagsWidget() {
    if (_item == null || _item!.tags == null || _item!.tags!.isEmpty) {
      return Container(
        padding: EdgeInsets.only(top: 8, bottom: YJConstant.padding),
      );
    }
    Color color = Colors.grey[100] ?? Colors.grey;

    List<Widget> tags = [];
    var temps = [];
    temps.addAll(_item!.tags!);
    // temps.addAll(_item!.tags!);
    // temps.addAll(_item!.tags!);
    // temps.addAll(_item!.tags!);
    // temps.addAll(_item!.tags!);
    for (String tag in temps) {
      Container container = Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: YJColor.tipColor(),
            fontSize: YJConstant.smallTipFontSize,
          ),
        ),
      );

      tags.add(container);
    }

    return Container(
      padding: EdgeInsets.only(top: 8, bottom: YJConstant.padding),
      alignment: Alignment.centerLeft,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 4,
        runSpacing: 4,
        children: tags,
      ),
    );
  }

  Widget _commetWidget() {
    if (_item == null || _item?.commentNum == null || _item?.commentNum! == 0) {
      return Container(
        padding: const EdgeInsets.only(top: 40, bottom: 40),
        child: Column(
          children: [
            Image.asset(
              "images/detail/no_message.png",
              height: 160,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Text(
              "还没有人发表评论",
              style: TextStyle(color: YJColor.tipColor()),
            ),
          ],
        ),
      );
    }
    return CommentListWidget(id);
  }

  Widget _nextButtonWidget() {
    return Positioned(
      bottom: 70,
      right: 0,
      width: 50,
      height: 50,
      child: FloatingActionButton(
        onPressed: () {
          if (_item != null && _item?.nextArticleId != null) {
            id = _item!.nextArticleId!;
            _requestData();
            // context.pushReplacement("/pages/detail/${_item?.nextArticleId}");
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        child: Image.asset("images/detail/iconnext.png"),
      ),
    );
  }

  Widget _bottomFuncWidget() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      height: 50,
      child: BottomFunctionWidget(_item, _focusNode),
    );
  }
}
