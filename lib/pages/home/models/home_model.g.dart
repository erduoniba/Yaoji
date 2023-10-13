// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvItem _$AdvItemFromJson(Map<String, dynamic> json) => AdvItem(
      json['cover_img'] as String?,
      json['id'] as int,
      json['title'] as String,
    );

Map<String, dynamic> _$AdvItemToJson(AdvItem instance) => <String, dynamic>{
      'cover_img': instance.coverImg,
      'id': instance.id,
      'title': instance.title,
    };

AdvModel _$AdvModelFromJson(Map<String, dynamic> json) => AdvModel(
      (json['list'] as List<dynamic>)
          .map((e) => AdvItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdvModelToJson(AdvModel instance) => <String, dynamic>{
      'list': instance.list,
    };
