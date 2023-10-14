import 'package:flutter/material.dart';

final class HomeAdvView extends StatelessWidget {
  HomeAdvView({super.key, required this.imgUrl});
  late String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Image.network(imgUrl),
    );
  }
}
