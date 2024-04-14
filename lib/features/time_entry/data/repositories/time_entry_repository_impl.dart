import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_request.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_response.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/remote_data_sources/time_entry_remote_data_source.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/repositories/time_entry_repository.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';

class TimeEntryRepositoryImpl implements TimeEntryRepository {
  final TimeEntryRemoteDataSource _timeEntryRemoteDataSource;

  final RequestMapper<TimeEntry, TimeEntryRequest> _timeEntryRequestMapper;

  final ResponseMapper<TimeEntry, TimeEntryResponse> _timeEntryResponseMapper;

  TimeEntryRepositoryImpl(this._timeEntryRemoteDataSource, this._timeEntryRequestMapper, this._timeEntryResponseMapper);

  @override
  EitherFailureOr<List<TimeEntry>> getTimeEntries() async {
    final result = await _timeEntryRemoteDataSource.getTimeEntries();
    List<TimeEntry> timeEntries = result.map(_timeEntryResponseMapper).toList();
    return Right(timeEntries);
  }

  @override
  EitherFailureOr<void> deleteTimeEntry(timeEntryId) async {
    final result = await _timeEntryRemoteDataSource.deleteTimeEntry(timeEntryId);
    return Right(result);
  }

  @override
  EitherFailureOr<TimeEntry> addTimeEntry(TimeEntry timeEntry) async {
    final result = await _timeEntryRemoteDataSource.addTimeEntry(_timeEntryRequestMapper(timeEntry));
    return Right(_timeEntryResponseMapper(result));
  }

  @override
  EitherFailureOr<TimeEntry> updateTimeEntry(String timeEntryId, TimeEntry timeEntry) async {
    final result = await _timeEntryRemoteDataSource.updateTimeEntry(timeEntryId, _timeEntryRequestMapper(timeEntry));
    return Right(_timeEntryResponseMapper(result));
  }
}
