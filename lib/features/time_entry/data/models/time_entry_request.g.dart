// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeEntryRequest _$TimeEntryRequestFromJson(Map<String, dynamic> json) =>
    TimeEntryRequest(
      description: json['description'] as String?,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      projectId: json['projectId'] as String,
    );

Map<String, dynamic> _$TimeEntryRequestToJson(TimeEntryRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'projectId': instance.projectId,
    };
