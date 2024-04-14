import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/repositories/time_entry_repository.dart';

class UpdateTimeEntryUseCase {
  final TimeEntryRepository _timeEntryRepository;

  UpdateTimeEntryUseCase(this._timeEntryRepository);

  EitherFailureOr<void> call(String timeEntryId, TimeEntry timeEntry) async {
    return await _timeEntryRepository.updateTimeEntry(timeEntryId, timeEntry);
  }
}
