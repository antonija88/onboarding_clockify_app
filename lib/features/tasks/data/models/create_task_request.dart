import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_task_request.g.dart';

@JsonSerializable()
class CreateTaskRequest extends Equatable {
  final String name;

  const CreateTaskRequest({
    required this.name,
  });

  factory CreateTaskRequest.fromJson(Map<String, dynamic> json) => _$CreateTaskRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTaskRequestToJson(this);

  @override
  List<Object?> get props => [
        name,
      ];
}
