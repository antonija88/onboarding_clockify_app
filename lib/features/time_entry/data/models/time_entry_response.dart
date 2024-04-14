import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_interval.dart';
part 'time_entry_response.g.dart';


@JsonSerializable()
class TimeEntryResponse extends Equatable {
  final String id;
  final String? taskId;

  final String description;

  final TimeInterval timeInterval;

  const TimeEntryResponse(this.id, this.taskId, this.description, this.timeInterval);

  factory TimeEntryResponse.fromJson(Map<String, dynamic> json) => _$TimeEntryResponseFromJson(json);
  @override
  List<Object?> get props => [id, taskId, description, timeInterval];
}
