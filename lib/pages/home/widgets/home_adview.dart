import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

final class HomeAdvView extends StatelessWidget {
  const HomeAdvView({
    super.key,
    required this.imgUrl,
    required this.id,
  });
  final String imgUrl;
  final String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/pages/detail/$id");
      },
      child: Container(
        height: 120,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: CachedNetworkImage(imageUrl: imgUrl),
      ),
    );
  }
}
