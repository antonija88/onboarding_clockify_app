import 'package:json_annotation/json_annotation.dart';

part 'time_entry_request.g.dart';

@JsonSerializable()
class TimeEntryRequest {
  final String? description;

  final DateTime start;

  final DateTime end;


  final String projectId;

  const TimeEntryRequest({this.description, required this.start, required this.end, required this.projectId});

  factory TimeEntryRequest.fromJson(Map<String, dynamic> json) => _$TimeEntryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TimeEntryRequestToJson(this);
}
