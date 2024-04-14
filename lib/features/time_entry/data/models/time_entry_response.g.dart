// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeEntryResponse _$TimeEntryResponseFromJson(Map<String, dynamic> json) =>
    TimeEntryResponse(
      json['id'] as String,
      json['taskId'] as String?,
      json['description'] as String,
      TimeInterval.fromJson(json['timeInterval'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimeEntryResponseToJson(TimeEntryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'description': instance.description,
      'timeInterval': instance.timeInterval,
    };
