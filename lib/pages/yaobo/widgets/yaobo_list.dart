import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yaoji/common/constant.dart';

class YJYaoboItem {
  String name;
  String desc;
  String image;
  int category;

  YJYaoboItem(this.name, this.desc, this.image, this.category);
}

final class YJYaoboListItemWidget extends StatelessWidget {
  YJYaoboItem item;
  YJYaoboListItemWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(YJConstant.padding),
      margin: EdgeInsets.only(bottom: YJConstant.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(YJConstant.radiusValue),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              Text(
                item.name,
                style: TextStyle(fontSize: YJConstant.titleFontSize),
              ),
              Text(
                item.desc,
                style: TextStyle(fontSize: YJConstant.contentFontSize),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          CachedNetworkImage(
              imageUrl: "https://file.cbaigui.com/img/1693626778704767774.png"),
        ],
      ),
    );
  }
}
