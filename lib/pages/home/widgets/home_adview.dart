import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:yaoji/pages/home/models/home_model.dart';
import 'package:yaoji/common/colors.dart';
import 'package:yaoji/common/constant.dart';

final class HomeAdvView extends StatelessWidget {
  const HomeAdvView({
    super.key,
    required this.advModel,
  });
  final AdvModel advModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Swiper(
        itemCount: advModel.list.length,
        itemBuilder: (context, index) {
          AdvItem item = advModel.list[index];
          return Container(
            height: 120,
            padding: EdgeInsets.only(
                left: YJConstant.padding, right: YJConstant.padding),
            child: CachedNetworkImage(
              imageUrl: item.coverImg ?? "",
              memCacheHeight: 120,
            ),
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.white,
            activeColor: YJColor.themeColor(),
          ),
        ),
        onTap: (index) {
          AdvItem item = advModel.list[index];
          context.push("/pages/detail/${item.id}");
        },
      ),
    );
  }

  // @override
  // State<StatefulWidget> createState() {
  //   return _HomeAdvViewState();
  // }
}

// class _HomeAdvViewState extends State<HomeAdvView> {
//   @override
//   Widget build(BuildContext context) {
//     // return SizedBox(
//     //   height: 120,
//     //   child: CachedNetworkImage(imageUrl: advModel.list.first.coverImg ?? ""),
//     // );

//   }
// }