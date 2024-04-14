import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_response.g.dart';

@JsonSerializable()
class TasksResponse {
  final List<TaskResponse> tasks;

  TasksResponse(this.tasks);
  factory TasksResponse.fromJson(Map<String, dynamic> json) => _$TasksResponseFromJson(json);
}

@JsonSerializable()
class TaskResponse extends Equatable {
  final String id;
  final String name;
  final String status;

  const TaskResponse(this.id, this.name, this.status);
  factory TaskResponse.fromJson(Map<String, dynamic> json) => _$TaskResponseFromJson(json);
  @override
  List<Object?> get props => [id, name, status];
}
