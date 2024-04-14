// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_interval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) => TimeInterval(
      json['duration'] as String,
      DateTime.parse(json['end'] as String),
      DateTime.parse(json['start'] as String),
    );

Map<String, dynamic> _$TimeIntervalToJson(TimeInterval instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'end': instance.end.toIso8601String(),
      'start': instance.start.toIso8601String(),
    };
