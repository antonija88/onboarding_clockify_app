import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/tasks_response.dart';

import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';

abstract interface class TaskRepository {
  EitherFailureOr<List<Task>> getTasks();

  EitherFailureOr<TaskResponse> deleteTask(String taskId);

  EitherFailureOr<TaskResponse> addTask(String name);
  EitherFailureOr<TaskResponse> updateTask(String taskId, String name, String status);

}
