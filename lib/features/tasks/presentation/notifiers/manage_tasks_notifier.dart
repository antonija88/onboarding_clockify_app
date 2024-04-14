import 'package:either_dart/either.dart';
import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/delete_task_use_case.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/add_task_use_case.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/update_task_use_case.dart';

class ManageTasksNotifier extends BaseStateNotifier<String> {
  final DeleteTaskUseCase _deleteTaskUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;

  ManageTasksNotifier(super.ref, this._deleteTaskUseCase, this._addTaskUseCase, this._updateTaskUseCase);

  Future<void> deleteTask(String taskId) async {
    showGlobalLoading();
    final result = await _deleteTaskUseCase.call(taskId);
    result.fold((failure) => state = BaseState.error(failure), (right) => state = const BaseState.data('Successfully deleted'));
    state = const BaseState.initial();
    clearGlobalLoading();
  }

  Future<void> addTask(String name) async {
    showGlobalLoading();
    state = const BaseState.loading();
    final result = (await _addTaskUseCase.call(name)).fold(
      (failure) => state = BaseState.error(failure),
      (right) => state = const BaseState.data('Task successfully added'),
    );
    state = const BaseState.initial();
    clearGlobalLoading();
  }

  Future<void> updateTask(String taskId, String name, String status) async {
    showGlobalLoading();
    final result = await _updateTaskUseCase.call(taskId, name, status).fold(
          (failure) => state = BaseState.error(failure),
          (right) => state = const BaseState.data('Task successfully updated'),
        );
    state = const BaseState.initial();
    clearGlobalLoading();
  }
}
