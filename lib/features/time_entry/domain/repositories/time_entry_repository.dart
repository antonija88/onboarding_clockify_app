import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';


abstract interface class TimeEntryRepository {
  EitherFailureOr<List<TimeEntry>> getTimeEntries();

  EitherFailureOr<TimeEntry> addTimeEntry(TimeEntry timeEntry);

  EitherFailureOr<void> deleteTimeEntry(String timeEntryId);

  EitherFailureOr<TimeEntry> updateTimeEntry(String timeEntryId, TimeEntry timeEntry);
}
