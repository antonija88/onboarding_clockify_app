import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/features/tasks/data/models/tasks_response.dart';

final tasksMapperProvider = Provider<ResponseMapper<List<Task>, TasksResponse>>((ref) => (response) {
      List<Task> tasks = response.tasks.map(ref.read(taskEntityMapperProvider)).toList();
      return tasks;
    });

final taskEntityMapperProvider = Provider<ResponseMapper<Task, TaskResponse>>((ref) => (response) {
      return Task(response.id, response.name, response.status);
    });
