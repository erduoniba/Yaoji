import 'dart:ffi';

import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

@JsonSerializable()
class Book {
  int? id;
  @JsonKey(name: "article_id")
  int? articleId;
  String? name;
  String? origin;
  String? translate;

  Book(
    this.id,
    this.articleId,
    this.name,
    this.origin,
    this.translate,
  );

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class ProductItem {
  // API 返回带有 蛇形命名方式 的对象，并且你想要在你的模型里使用
  // 小驼峰 的命名方式，你可以使用带有一个 name 参数的 @JsonKey 注解
  @JsonKey(name: 'cover_img')
  String? coverImg;

  List<Book> books;

  String? author;
  int? category;
  @JsonKey(name: "collect_num")
  int? collectNum;
  @JsonKey(name: "comment_num")
  int? commentNum;
  @JsonKey(name: "content_img")
  String? contentImg;
  String? content;
  String? date;
  String? introduction;
  @JsonKey(name: "like_num")
  int? likeNum;

  @JsonKey(name: "is_collect")
  int? isCollect;
  @JsonKey(name: "is_like")
  int? isLike;

  @JsonKey(name: "next_article_id")
  int? nextArticleId;
  @JsonKey(name: "next_article_title")
  String? nextArticleTitle;
  @JsonKey(name: "pic_author")
  String? picAuthor;

  List<String>? tags;
  String? title;

  ProductItem(
    this.coverImg,
    this.books,
    this.author,
    this.category,
    this.collectNum,
    this.commentNum,
    this.contentImg,
    this.content,
    this.date,
    this.introduction,
    this.likeNum,
    this.isCollect,
    this.isLike,
    this.nextArticleId,
    this.nextArticleTitle,
    this.picAuthor,
    this.tags,
    this.title,
  );

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}




/*
{
    "code": 1,
    "msg": "成功",
    "data": {
        "author": "纪妖",
        "books": [
            {
                "id": 5564,
                "created_at": "2023-10-19 00:55:14",
                "updated_at": "2023-10-19 00:55:14",
                "article_id": 3286,
                "name": "夜航船",
                "origin": "<p class=\"MsoNormal\">撫州學有右軍墨池。韓子蒼《雜記》：池中忽時水黑，謂之墨龍。此物見，則士子應試者，得人必多。屢驗。</p><p class=\"MsoNormal\"> </p>",
                "translate": ""
            },
            {
                "id": 5565,
                "created_at": "2023-10-19 00:55:14",
                "updated_at": "2023-10-19 00:55:14",
                "article_id": 3286,
                "name": "舆地纪胜",
                "origin": "<p class=\"MsoNormal\">墨龍 韓子蒼雜記云墨龍在大成殿前池中忽時水黑有物出鳴蜥謂之墨龍此物每見士之試于有司者得人必多卒以此爲驗咸平間御史黃公符詩云往往吐烏雲依依如皂盖</p>",
                "translate": "<p class=\"MsoNormal\">韩子苍《杂记》说：墨龙在大成殿前的池子里，有时候水会变黑，有一种动物会从水里冒出来，叫声像蜥蜴，人们叫它“墨龙”。这种动物每次出现，都是在土试的时候，而且考中进士的人都很多，所以人们把它当作是吉祥的征兆。咸平年间，有一个御史叫黄公符，他写了一首诗：“往往吐乌云，依依如皂盖。”</p>"
            }
        ],
        "category": 4,
        "collect_num": 7,
        "comment_num": 1,
        "content": "<p class=\"MsoNormal\">墨龙出现在大成殿前的墨池中，出现时水会变黑，是会有很多人考中津士的征兆。</p>",
        "content_img": "",
        "content_imgs": [],
        "cover_img": "https://file.cbaigui.com/img/1697647988848549535.png",
        "cover_img_name": "",
        "date": "2023-10-19",
        "has_translate": true,
        "introduction": "出现在大成殿前的墨池",
        "is_allow_comment": 1,
        "is_collect": 2,
        "is_like": 2,
        "is_share": 2,
        "like_num": 4,
        "next_article_id": 3285,
        "next_article_title": "玄武庙蝙蝠",
        "pic_author": "",
        "pre_article_id": 0,
        "pre_article_title": "",
        "relation": [],
        "share_num": 0,
        "status": 1,
        "tags": [
            "龙",
            "神兽",
            "水",
            "才学",
            "祥瑞",
            "蜥蜴",
            "水中",
            "宋",
            "中国"
        ],
        "title": "墨龙",
        "water_cover_img": "https://file.cbaigui.com/org/1697647988848549535.png",
        "words": "",
        "words_id": 0
    }
}
*/