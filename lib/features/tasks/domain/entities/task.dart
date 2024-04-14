import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.g.dart';


@JsonSerializable()
class Task extends Equatable {
  final String id;
  final String name;
  final String status;

  const Task(this.id, this.name, this.status);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  List<Object?> get props => [id, name, status];
}
