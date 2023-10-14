import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// 该文件中还有部分独立的代码实现在 home_model.g.dart 中
// home_model.g.dart 代码是通过在开发环境下 json_serializable 和
// build_runner 自动生成的
part 'home_model.g.dart';

// 首页广告数据
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
    for (var item in list) {
      debugPrint('title: ${item.title}');
    }
  }
}

/*
{
    "brief": "驮着河图出现的龙马，高八尺五寸，长颈，骼上有翼，旁有垂尾，蹈水不没。",
    "category": 4,
    "cover_img": "https://file.cbaigui.com/img/1626361307320076277.JPG",
    "date": "2023-03-17",
    "date_nl": "二月廿六",
    "date_normal": "3月17日",
    "date_traditional": "",
    "date_year": "癸卯",
    "id": 498,
    "title": "龙马"
}
*/
// 首页列表数据
@JsonSerializable()
class HistoryItem {
  // API 返回带有 蛇形命名方式 的对象，并且你想要在你的模型里使用
  // 小驼峰 的命名方式，你可以使用带有一个 name 参数的 @JsonKey 注解
  @JsonKey(name: 'cover_img')
  String? coverImg;

  String? brief;
  int? category;
  String? date;

  @JsonKey(name: 'date_nl')
  String? dateNl;
  @JsonKey(name: 'date_normal')
  String? dateNormal;
  @JsonKey(name: 'date_traditional')
  String? dateTraditional;
  @JsonKey(name: 'date_year')
  String? dateYear;

  int id;
  String? title;

  HistoryItem(
    this.coverImg,
    this.brief,
    this.category,
    this.date,
    this.dateNl,
    this.dateNormal,
    this.dateTraditional,
    this.dateYear,
    this.id,
    this.title,
  );

  factory HistoryItem.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryItemToJson(this);
}

@JsonSerializable()
class HistoryModel {
  List<HistoryItem> list;
  HistoryModel(this.list);

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);

  description() {
    for (var item in list) {
      debugPrint('title: ${item.title}');
    }
  }
}
