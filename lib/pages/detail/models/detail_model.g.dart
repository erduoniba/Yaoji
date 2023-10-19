// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      json['cover_img'] as String?,
      json['content'] as String?,
      json['category'] as int?,
      json['date'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'cover_img': instance.coverImg,
      'content': instance.content,
      'category': instance.category,
      'date': instance.date,
      'title': instance.title,
    };
