import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/repositories/task_repository.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/tasks_response.dart';

class AddTaskUseCase {
  final TaskRepository _taskRepository;

  AddTaskUseCase(this._taskRepository);

  EitherFailureOr<TaskResponse> call(String name) async {
    final result = await _taskRepository.addTask(name);
    return result.fold((left) => Left(left), (right) => Right(right));
  }
}
