// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YJCommentItem _$YJCommentItemFromJson(Map<String, dynamic> json) =>
    YJCommentItem(
      json['avatar'] as String?,
      json['content'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['receiver_name'] as String?,
      json['time'] as String?,
      json['time_hour'] as String?,
      json['type'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => YJCommentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$YJCommentItemToJson(YJCommentItem instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'content': instance.content,
      'id': instance.id,
      'name': instance.name,
      'receiver_name': instance.receiverName,
      'time': instance.time,
      'time_hour': instance.timeHour,
      'type': instance.type,
      'items': instance.items,
    };

YJCommentModel _$YJCommentModelFromJson(Map<String, dynamic> json) =>
    YJCommentModel(
      (json['list'] as List<dynamic>)
          .map((e) => YJCommentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
    );

Map<String, dynamic> _$YJCommentModelToJson(YJCommentModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
    };
