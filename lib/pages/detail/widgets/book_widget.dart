import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/pages/detail/models/detail_model.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  final bool showTranslate;
  const BookWidget(this.book, this.showTranslate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _titleWidget(context),
          _originWidget(),
          _translateWidget(),
        ],
      ),
    );
  }

  Widget _titleWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 1,
            color: Colors.black12,
          ),
          Center(
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: Text("《${book.name ?? ""}》"),
              ),
              onTap: () {
                context.push(
                  "/pages/article",
                  extra: {"bookName": book.name},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _originWidget() {
    return Html(data: book.origin);
  }

  Widget _translateWidget() {
    if (book.translate != null && book.translate!.isNotEmpty && showTranslate) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "  译文",
            style: TextStyle(color: YJColor.themeColor()),
          ),
          Html(
            data: book.translate,
            style: {
              "p": Style(color: YJColor.themeColor()),
            },
          ),
        ],
      );
    }
    return Container();
  }
}
