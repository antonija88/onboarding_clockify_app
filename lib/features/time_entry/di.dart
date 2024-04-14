import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:onboarding_clockify_app/core/di.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/mappers/time_entry_mappers.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/repositories/time_entry_repository_impl.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/repositories/time_entry_repository.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/add_time_entry_usecase.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/delete_time_entry_usecase.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/get_time_entries_use_case.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/usecases/update_time_entry_usecase.dart';
import 'package:onboarding_clockify_app/features/time_entry/presentation/notifiers/manage_time_entry_notifier.dart';
import 'package:onboarding_clockify_app/features/time_entry/presentation/notifiers/time_entry_notifier.dart';

//
// ********* DATA LAYER *********
final timeEntryRepositoryProvider = Provider<TimeEntryRepository>((ref) {
  return TimeEntryRepositoryImpl(
      ref.watch(apiClientProvider), ref.watch(timeEntryRequestMapperProvider), ref.read(timeEntryResponseMapperProvider));
});
//
//
// ******** DOMAIN LAYER ********
final timeEntryUseCaseProvider = Provider<GetTimeEntriesUseCase>((ref) {
  return GetTimeEntriesUseCase(ref.watch(timeEntryRepositoryProvider));
});

final deleteTimeEntryUseCaseProvider = Provider<DeleteTimeEntryUseCase>((ref) {
  return DeleteTimeEntryUseCase(ref.watch(timeEntryRepositoryProvider));
});

final addTimeEntryUseCaseProvider = Provider<AddTimeEntryUseCase>((ref) {
  return AddTimeEntryUseCase(ref.watch(timeEntryRepositoryProvider));
});

final updateTimeEntryUseCaseProvider = Provider<UpdateTimeEntryUseCase>((ref) {
  return UpdateTimeEntryUseCase(
    ref.watch(timeEntryRepositoryProvider),
  );
});

// // ***** PRESENTATION LAYER ******
final timeEntryNotifierProvider = BaseStateNotifierProvider<TimeEntryNotifier, List<TimeEntry>>(
  (ref) => TimeEntryNotifier(ref, ref.watch(timeEntryUseCaseProvider))..getTimeEntries(),
);

final manageTimeEntryProvider = BaseStateNotifierProvider<ManageTimeEntryNotifier, String>((ref) {
  return ManageTimeEntryNotifier(
      ref, ref.watch(addTimeEntryUseCaseProvider), ref.watch(updateTimeEntryUseCaseProvider), ref.watch(deleteTimeEntryUseCaseProvider));
});
