import 'package:json_annotation/json_annotation.dart';
part 'update_task_request.g.dart';

@JsonSerializable()
class UpdateTaskRequest {
  final String name;
  final String? status;

  UpdateTaskRequest({
    required this.name,
    required this.status,
  });

  factory UpdateTaskRequest.fromJson(Map<String, dynamic> json) => _$UpdateTaskRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTaskRequestToJson(this);
}
