import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:onboarding_clockify_app/features/time_entry/di.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/get_time_entries_use_case.dart';

class TimeEntryNotifier extends BaseStateNotifier<List<TimeEntry>> {
  final GetTimeEntriesUseCase _getTimeEntriesUseCase;

  TimeEntryNotifier(super.ref, this._getTimeEntriesUseCase) {
    _subscribeToManageTimeEntry();
  }
  void getTimeEntries() {
    execute(_getTimeEntriesUseCase());
  }

  void _subscribeToManageTimeEntry() => on(
        manageTimeEntryProvider,
        (previous, next) {
          getTimeEntries();
        },
      );
}
