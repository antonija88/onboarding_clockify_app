import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/repositories/time_entry_repository.dart';

class DeleteTimeEntryUseCase {
  final TimeEntryRepository _timeEntryRepository;

  DeleteTimeEntryUseCase(this._timeEntryRepository);

  EitherFailureOr<void> call(String timeEntryId) async {
    return await _timeEntryRepository.deleteTimeEntry(timeEntryId);
  }
}
