import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/core/di.dart';
import 'package:onboarding_clockify_app/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/repositories/task_repository.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/tasks_response.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/get_tasks_use_case.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/update_task_use_case.dart';
import 'package:onboarding_clockify_app/features/tasks/presentation/notifiers/manage_tasks_notifier.dart';
import 'package:onboarding_clockify_app/features/tasks/presentation/notifiers/tasks_notifier.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/delete_task_use_case.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/usecases/add_task_use_case.dart';

// ********* DATA LAYER *********
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl(ref.watch(apiClientProvider), ref.watch(taskResponseMapperProvider));
});

final taskResponseMapperProvider = Provider<ResponseMapper<Task, TaskResponse>>((ref) {
  return (response) => Task(response.id, response.name, response.status);
});

// ******** DOMAIN LAYER ********
final taskUseCaseProvider = Provider<GetTasksUseCase>((ref) {
  return GetTasksUseCase(ref.watch(taskRepositoryProvider));
});

final deleteTaskUseCaseProvider = Provider<DeleteTaskUseCase>((ref) {
  return DeleteTaskUseCase(ref.watch(taskRepositoryProvider));
});

final addTaskUseCaseProvider = Provider<AddTaskUseCase>((ref) {
  return AddTaskUseCase(ref.watch(taskRepositoryProvider));
});

final updateTaskUseCaseProvider = Provider<UpdateTaskUseCase>((ref) {
  return UpdateTaskUseCase(
    ref.watch(taskRepositoryProvider),
  );
});

// ***** PRESENTATION LAYER ******
final taskNotifierProvider = BaseStateNotifierProvider<TasksNotifier, List<Task>>(
  (ref) => TasksNotifier(ref, ref.watch(taskUseCaseProvider))..getTasks(),
);

final manageTaskProvider = BaseStateNotifierProvider<ManageTasksNotifier, String>((ref) {
  return ManageTasksNotifier(
      ref, ref.watch(deleteTaskUseCaseProvider), ref.watch(addTaskUseCaseProvider), ref.watch(updateTaskUseCaseProvider));
});
