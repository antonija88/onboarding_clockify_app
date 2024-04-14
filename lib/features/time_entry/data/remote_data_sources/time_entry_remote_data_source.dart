import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_request.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_response.dart';


abstract interface class TimeEntryRemoteDataSource {
  Future<List<TimeEntryResponse>> getTimeEntries();

  Future<TimeEntryResponse> addTimeEntry(TimeEntryRequest timeEntryRequest);

  Future<void> deleteTimeEntry(String timeEntryId);

  Future<TimeEntryResponse> updateTimeEntry(String taskId, TimeEntryRequest timeEntryRequest);
}
