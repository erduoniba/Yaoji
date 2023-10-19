import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

@JsonSerializable()
class ProductItem {
  // API 返回带有 蛇形命名方式 的对象，并且你想要在你的模型里使用
  // 小驼峰 的命名方式，你可以使用带有一个 name 参数的 @JsonKey 注解
  @JsonKey(name: 'cover_img')
  String? coverImg;

  String? content;
  int? category;
  String? date;

  ProductItem(
    this.coverImg,
    this.content,
    this.category,
    this.date,
  );

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
