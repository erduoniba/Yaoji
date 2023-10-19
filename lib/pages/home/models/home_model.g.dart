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

HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) => HistoryItem(
      json['cover_img'] as String?,
      json['brief'] as String?,
      json['category'] as int?,
      json['date'] as String?,
      json['date_nl'] as String?,
      json['date_normal'] as String?,
      json['date_traditional'] as String?,
      json['date_year'] as String?,
      json['id'] as int,
      json['title'] as String?,
    )..showDate = json['showDate'] as String?;

Map<String, dynamic> _$HistoryItemToJson(HistoryItem instance) =>
    <String, dynamic>{
      'cover_img': instance.coverImg,
      'brief': instance.brief,
      'category': instance.category,
      'date': instance.date,
      'date_nl': instance.dateNl,
      'date_normal': instance.dateNormal,
      'date_traditional': instance.dateTraditional,
      'date_year': instance.dateYear,
      'id': instance.id,
      'title': instance.title,
      'showDate': instance.showDate,
    };

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      (json['list'] as List<dynamic>)
          .map((e) => HistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
