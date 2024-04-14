import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/repositories/time_entry_repository.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';

class GetTimeEntriesUseCase {
  final TimeEntryRepository _timeEntryRepository;

  GetTimeEntriesUseCase(this._timeEntryRepository);

  EitherFailureOr<List<TimeEntry>> call() async {
    final result = await _timeEntryRepository.getTimeEntries();
    return result.fold((left) => Left(left), (right) => Right(right));
  }
}
