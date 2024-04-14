import 'package:equatable/equatable.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_interval.dart';

class TimeEntry extends Equatable {
  final String id;

  final String description;

  final TimeInterval timeInterval;

  final String projectId;

  const TimeEntry({required this.id, required this.description, required this.timeInterval, required this.projectId});

  @override
  List<Object?> get props => [id, description, timeInterval, projectId];
}
