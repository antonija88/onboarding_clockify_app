import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/create_task_request.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/tasks_response.dart';
import 'package:onboarding_clockify_app/features/tasks/data/remote_data_sources/task_remote_data_source.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/repositories/task_repository.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/update_task_request.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _taskRemoteDataSource;
  final ResponseMapper<Task, TaskResponse> _taskMapper;

  TaskRepositoryImpl(this._taskRemoteDataSource, this._taskMapper);

  @override
  EitherFailureOr<List<Task>> getTasks() async {
    final result = await _taskRemoteDataSource.getTasks();
    return Right(result);
  }

  @override
  EitherFailureOr<TaskResponse> deleteTask(taskId) async {
    final result = await _taskRemoteDataSource.deleteTask(taskId);
    return Right(result);
  }

  @override
  EitherFailureOr<TaskResponse> addTask(String name) async {
    final result = await _taskRemoteDataSource.addTask(CreateTaskRequest(name: name));
    return Right(result);
  }

  @override
  EitherFailureOr<TaskResponse> updateTask(String taskId, String name, String status) async {
    final result = await _taskRemoteDataSource.updateTask(taskId, UpdateTaskRequest(name: name, status: status));
    return Right(result);
  }
}
