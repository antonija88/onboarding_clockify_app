// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksResponse _$TasksResponseFromJson(Map<String, dynamic> json) =>
    TasksResponse(
      (json['tasks'] as List<dynamic>)
          .map((e) => TaskResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TasksResponseToJson(TasksResponse instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) => TaskResponse(
      json['id'] as String,
      json['name'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$TaskResponseToJson(TaskResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };
