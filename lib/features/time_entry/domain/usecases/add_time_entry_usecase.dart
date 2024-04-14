import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/repositories/time_entry_repository.dart';

class AddTimeEntryUseCase {
  final TimeEntryRepository _timeEntryRepository;

  AddTimeEntryUseCase(this._timeEntryRepository);

  EitherFailureOr<void> call(TimeEntry timeEntry) async {
    return await _timeEntryRepository.addTimeEntry(timeEntry);
  }
}
