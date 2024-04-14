import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/repositories/task_repository.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';

class GetTasksUseCase {
  final TaskRepository _taskRepository;

  GetTasksUseCase(this._taskRepository);

  EitherFailureOr<List<Task>> call() async {
    final result = await _taskRepository.getTasks();
    return result.fold((left) => Left(left), (right) => Right(right));
  }
}
