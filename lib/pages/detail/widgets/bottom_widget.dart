import 'package:flutter/material.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/common/constant.dart';
import 'package:yaoji/pages/detail/models/detail_model.dart';

final class BootomFunctionWidget extends StatelessWidget {
  const BootomFunctionWidget(this._item, this._focusNode, {super.key});
  final ProductItem? _item;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 0, 8),
      color: Colors.white,
      height: 50,
      child: Row(
        children: [
          _commentTextField(context),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Expanded(child: _likeWidget()),
                Expanded(child: _collectWidget()),
                Expanded(child: _shareWidget()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _commentTextField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      width: MediaQuery.of(context).size.width - 150 - 50,
      child: TextField(
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10), // 设置垂直内边距
          fillColor: YJColor.lineColor(), // 背景颜色
          filled: true,
          hintText: "说点什么吧",
          hintStyle: TextStyle(
            fontSize: YJConstant.contentFontSize,
            color: YJColor.tipColor(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  Widget _collectWidget() {
    bool isCollect = false;
    if (_item != null && _item!.isCollect == 2) {
      isCollect = true;
    }
    String collectNum = "";
    if (_item != null && _item!.collectNum != null && _item!.collectNum! > 0) {
      collectNum = "${_item!.collectNum}";
    }
    return Stack(
      children: [
        IconButton(
          alignment: Alignment.center,
          enableFeedback: false,
          onPressed: () {},
          icon: isCollect
              ? Image.asset("images/detail/iconcollect1.png")
              : Image.asset("images/detail/iconcollect2.png"),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Text(
            collectNum,
            style: TextStyle(
              color: YJColor.contentColor(),
              fontSize: YJConstant.tipFontSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget _likeWidget() {
    bool isLike = false;
    if (_item != null && _item!.isLike == 2) {
      isLike = true;
    }
    String likeNumb = "";
    if (_item != null && _item!.likeNum != null && _item!.likeNum! > 0) {
      likeNumb = "${_item!.likeNum}";
    }
    return Stack(
      children: [
        IconButton(
          alignment: Alignment.center,
          enableFeedback: false,
          onPressed: () {},
          icon: isLike
              ? Image.asset("images/detail/iconpraise1.png")
              : Image.asset("images/detail/iconpraise2.png"),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Text(
            likeNumb,
            style: TextStyle(
              color: YJColor.contentColor(),
              fontSize: YJConstant.tipFontSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget _shareWidget() {
    return IconButton(
      alignment: Alignment.center,
      enableFeedback: false,
      onPressed: () {},
      icon: Image.asset("images/detail/iconshare1.png"),
    );
  }
}
