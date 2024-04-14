import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_interval.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/add_time_entry_usecase.dart';

import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/delete_time_entry_usecase.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/update_time_entry_usecase.dart';

class ManageTimeEntryNotifier extends BaseStateNotifier<String> {
  final AddTimeEntryUseCase _addTimeEntryUseCase;

  final UpdateTimeEntryUseCase _updateTimeEntryUseCase;

  final DeleteTimeEntryUseCase _deleteTimeEntryUseCase;

  ManageTimeEntryNotifier(super.ref, this._addTimeEntryUseCase, this._updateTimeEntryUseCase, this._deleteTimeEntryUseCase);

  Future<void> addTimeEntry(String description, DateTime start, DateTime end) async {
    state = const BaseState.loading();
    TimeInterval timeInterval = TimeInterval('', end, start);
    final result = await _addTimeEntryUseCase.call(TimeEntry(
      id: '',
      description: description,
      timeInterval: timeInterval,
      projectId: '',
    ));
    result.fold((failure) => state = BaseState.error(failure), (right) => state = const BaseState.data('Time successfully added'));
    state = const BaseState.initial();
  }

  Future<void> updateTimeEntry(String taskTimeEntryId, String description, DateTime start, DateTime end) async {
    state = const BaseState.loading();
    TimeInterval timeInterval = TimeInterval('', end, start);
    final result = await _updateTimeEntryUseCase.call(
        taskTimeEntryId,
        TimeEntry(
          id: '',
          description: description,
          timeInterval: timeInterval,
          projectId: '',
        ));
    result.fold((failure) => state = BaseState.error(failure), (right) => state = const BaseState.data('Time successfully updated'));
    state = const BaseState.initial();
  }

  Future<void> deleteTimeEntry(String timeEntryId) async {
    state = const BaseState.loading();
    final result = await _deleteTimeEntryUseCase.call(timeEntryId);
    result.fold((failure) => state = BaseState.error(failure), (right) => state = const BaseState.data('Time successfully deleted'));
    state = const BaseState.initial();
    clearGlobalLoading();
  }
}
