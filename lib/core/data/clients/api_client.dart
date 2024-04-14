import 'package:dio/dio.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/create_task_request.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/tasks_response.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/update_task_request.dart';
import 'package:onboarding_clockify_app/features/tasks/data/remote_data_sources/task_remote_data_source.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_request.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_entry_response.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/remote_data_sources/time_entry_remote_data_source.dart';
import 'package:retrofit/http.dart';
part 'api_client.g.dart';

@RestApi()
abstract class ApiClient implements TaskRemoteDataSource, TimeEntryRemoteDataSource {
  factory ApiClient(Dio dio) = _ApiClient;

  @override
  @GET('/projects/660d73198fe56064c26a59aa/tasks')
  Future<List<Task>> getTasks();

  @override
  @DELETE('/projects/660d73198fe56064c26a59aa/tasks/{taskId}')
  Future<TaskResponse> deleteTask(@Path('taskId') String taskId);

  @override
  @POST('/projects/660d73198fe56064c26a59aa/tasks')
  Future<TaskResponse> addTask(@Body() CreateTaskRequest createTaskRequest);

  @override
  @PUT('/projects/660d73198fe56064c26a59aa/tasks/{taskId}')
  Future<TaskResponse> updateTask(@Path('taskId') String taskId, @Body() UpdateTaskRequest updateTaskRequest);

  @override
  @GET('/user/6606d0807288ae7525947b01/time-entries')
  Future<List<TimeEntryResponse>> getTimeEntries();

  @override
  @POST('/time-entries')
  Future<TimeEntryResponse> addTimeEntry(@Body() TimeEntryRequest createTimeEntryRequest);

  @override
  @PUT('/time-entries/{id}')
  Future<TimeEntryResponse> updateTimeEntry(@Path('id') String timeEntryId, @Body() TimeEntryRequest updateTaskRequest);

  @override
  @DELETE('/time-entries/{id}')
  Future<void> deleteTimeEntry(@Path('id') String id);
}
