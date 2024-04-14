import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'time_interval.g.dart';

@JsonSerializable()
class TimeInterval extends Equatable {
  final String duration;
  final DateTime end;
  final DateTime start;

  const TimeInterval(this.duration, this.end, this.start);
  factory TimeInterval.fromJson(Map<String, dynamic> json) => _$TimeIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$TimeIntervalToJson(this);

  @override
  List<Object?> get props => [end, start, duration];
}
