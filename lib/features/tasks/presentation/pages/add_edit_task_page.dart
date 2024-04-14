import 'package:flutter/material.dart';
import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/core/data/presentation/widgets/app_button.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/features/tasks/di.dart';
import 'package:onboarding_clockify_app/core/data/presentation/constants/app_sizes.dart';

class AddEditTaskPage extends ConsumerWidget {
  final Task? task;

  AddEditTaskPage(this.task, {super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<BaseState<String>>(manageTaskProvider, (_, next) {
      switch (next) {
        case BaseData<String>(data: final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(message),
            ),
          );
          Navigator.of(context).pop();

        case _:
      }
    });

    final tasksState = ref.watch(taskNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'TASK',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: switch (tasksState) {
        BaseInitial<List<Task>>() => const Text('Initial'),
        BaseLoading() => const Center(child: CircularProgressIndicator()),
        BaseData(data: final tasks) => SafeArea(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    child: FormBuilderTextField(
                      name: 'taskName',
                      initialValue: task?.name,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        hintText: 'Add new task',
                        hintStyle: const TextStyle(color: Colors.black87),
                        contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                      ),
                    ),
                  ),

                  const Spacer(),
                  if (task != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: AppButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.saveAndValidate()) {
                                      final formMap = _formKey.currentState?.value;
                                      ref.watch(manageTaskProvider.notifier).updateTask(task!.id, formMap?['taskName'], 'ACTIVE');
                                    }
                                  },
                                  buttonText: 'Save')),
                          const Gap(AppSizes.spacingMd),
                          if (task?.status != 'ACTIVE')
                            Expanded(
                              child: AppButton(
                                  onPressed: () {
                                    ref.watch(manageTaskProvider.notifier).deleteTask(task!.id);
                                  },
                                  buttonText: 'Delete'),
                            ),
                        ],
                      ),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: AppButton(
                                onPressed: () {
                                  if (_formKey.currentState!.saveAndValidate()) {
                                    final formMap = _formKey.currentState?.value;
                                    ref.watch(manageTaskProvider.notifier).addTask(formMap?['taskName']);
                                  }
                                },
                                buttonText: 'ADD'),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        BaseError(failure: final failure) => Text(failure.title),
      },
    );
  }
}
