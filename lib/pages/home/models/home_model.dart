import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// 该文件中还有部分独立的代码实现在 home_model.g.dart 中
// home_model.g.dart 代码是通过在开发环境下 json_serializable 和
// build_runner 自动生成的
part 'home_model.g.dart';

@JsonSerializable()
class AdvItem {
  // API 返回带有 蛇形命名方式 的对象，并且你想要在你的模型里使用
  // 小驼峰 的命名方式，你可以使用带有一个 name 参数的 @JsonKey 注解
  @JsonKey(name: 'cover_img')
  String? coverImg;

  int id;
  String title;

  AdvItem(
    this.coverImg,
    this.id,
    this.title,
  );

  factory AdvItem.fromJson(Map<String, dynamic> json) =>
      _$AdvItemFromJson(json);
  Map<String, dynamic> toJson() => _$AdvItemToJson(this);
}

@JsonSerializable()
class AdvModel {
  List<AdvItem> list;
  AdvModel(this.list);

  factory AdvModel.fromJson(Map<String, dynamic> json) =>
      _$AdvModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdvModelToJson(this);

  description() {
    for (var item in this.list) {
      debugPrint('title: ${item.title}');
    }
  }
}
