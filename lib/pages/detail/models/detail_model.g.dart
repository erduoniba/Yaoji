// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['id'] as int?,
      json['article_id'] as int?,
      json['name'] as String?,
      json['origin'] as String?,
      json['translate'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'article_id': instance.articleId,
      'name': instance.name,
      'origin': instance.origin,
      'translate': instance.translate,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      json['cover_img'] as String?,
      (json['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['author'] as String?,
      json['category'] as int?,
      json['collect_num'] as int?,
      json['comment_num'] as int?,
      json['content_img'] as String?,
      json['content'] as String?,
      json['date'] as String?,
      json['introduction'] as String?,
      json['like_num'] as int?,
      json['next_article_id'] as int?,
      json['next_article_title'] as String?,
      json['pic_author'] as String?,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['title'] as String?,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'cover_img': instance.coverImg,
      'books': instance.books,
      'author': instance.author,
      'category': instance.category,
      'collect_num': instance.collectNum,
      'comment_num': instance.commentNum,
      'content_img': instance.contentImg,
      'content': instance.content,
      'date': instance.date,
      'introduction': instance.introduction,
      'like_num': instance.likeNum,
      'next_article_id': instance.nextArticleId,
      'next_article_title': instance.nextArticleTitle,
      'pic_author': instance.picAuthor,
      'tags': instance.tags,
      'title': instance.title,
    };
