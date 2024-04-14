import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/get_tasks_use_case.dart';
import 'package:onboarding_clockify_app/features/tasks/di.dart';

class TasksNotifier extends BaseStateNotifier<List<Task>> {
  final GetTasksUseCase _getTasksUseCase;

  TasksNotifier(super.ref, this._getTasksUseCase) {
    _subscribeToManageTasks();
  }
  void getTasks() {
    execute(_getTasksUseCase());
  }

  void _subscribeToManageTasks() => on(
        manageTaskProvider,
        (previous, next) {
          getTasks();
        },
      );
}
