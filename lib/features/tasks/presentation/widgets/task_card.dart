import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/core/data/presentation/widgets/app_button.dart';
import 'package:onboarding_clockify_app/features/tasks/di.dart';

class TaskCard extends ConsumerWidget {
  final Task task;
  final Function() onTap;
  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.name,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    task.status,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              if (task.status == 'ACTIVE')
              Align(
                alignment: Alignment.centerLeft,
                child: AppButton(
                  onPressed: () {
                    ref.watch(manageTaskProvider.notifier).updateTask(task.id, task.name, 'DONE');
                  },
                  buttonText: 'Mark as done',
                  isTaskCard: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
