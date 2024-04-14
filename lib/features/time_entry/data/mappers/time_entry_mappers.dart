import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/core/di.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_response.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_request.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';

final timeEntryResponseMapperProvider = Provider<ResponseMapper<TimeEntry, TimeEntryResponse>>((ref) => (response) {
      return TimeEntry(
          id: response.id, description: response.description, timeInterval: response.timeInterval, projectId: ref.read(projectIdProvider));
    });

final timeEntryRequestMapperProvider = Provider<RequestMapper<TimeEntry, TimeEntryRequest>>((ref) => (request) {
      // DateFormat formattedEndDate = DateFormat('yyyy-MM-ddThh:mm:ssZ').format(request.timeInterval.end);

      return TimeEntryRequest(
        description: request.description,
        start: request.timeInterval.start.toUtc(),
        end: request.timeInterval.end.toUtc(),
        projectId: ref.read(projectIdProvider),
      );
    });
