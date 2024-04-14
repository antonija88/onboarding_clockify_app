import 'package:onboarding_clockify_app/features/tasks/data/models/tasks_response.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/update_task_request.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';

import 'package:onboarding_clockify_app/features/tasks/data/models/create_task_request.dart';

abstract interface class TaskRemoteDataSource {
  Future<List<Task>> getTasks();
  Future<TaskResponse> deleteTask(String taskId);

  Future<TaskResponse> addTask(CreateTaskRequest createTaskRequest);

  Future<TaskResponse> updateTask(String taskId, UpdateTaskRequest updateTaskRequest);

}
