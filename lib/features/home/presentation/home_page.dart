import 'package:flutter/material.dart';
import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/core/data/presentation/widgets/app_button.dart' show AppButton;
import 'package:onboarding_clockify_app/features/tasks/presentation/widgets/task_card.dart';
import 'package:onboarding_clockify_app/features/tasks/di.dart';
import 'package:onboarding_clockify_app/features/tasks/domain/entities/task.dart';
import 'package:onboarding_clockify_app/features/tasks/presentation/pages/add_edit_task_page.dart';
import 'package:onboarding_clockify_app/features/time_entry/presentation/pages/add_edit_time_entry_page.dart';
import 'package:onboarding_clockify_app/features/time_entry/di.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';
import 'package:onboarding_clockify_app/features/time_entry/presentation/widgets/time_entry_card.dart';
import 'package:onboarding_clockify_app/core/data/presentation/constants/app_sizes.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksState = ref.watch(taskNotifierProvider);
    final timeEntriesState = ref.watch(timeEntryNotifierProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.grey,
            labelColor: Colors.black87,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            tabs: [
              Text('TASK'),
              Text('TIME ENTRY'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            switch (tasksState) {
              BaseInitial<List<Task>>() => const Text('Initial'),
              BaseLoading() => const Center(child: CircularProgressIndicator()),
              BaseError(failure: final failure) => Text(failure.title),
              BaseData(data: final tasks) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return TaskCard(
                          task: tasks[index],
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddEditTaskPage(tasks[index])),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const Gap(AppSizes.spacingMd),
                      itemCount: tasks.length),
                ),
            },
            switch (timeEntriesState) {
              BaseData(data: final timeEntries) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return TimeEntryCard(
                          description: timeEntries[index].description,
                          timeInterval: timeEntries[index].timeInterval,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddEditTimeEntryPage(timeEntries[index])),
                            );
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const Gap(AppSizes.spacingMd),
                      itemCount: timeEntries.length),
                ),
              BaseInitial<List<TimeEntry>>() => const Text('Initial'),
              BaseLoading<List<TimeEntry>>() => const Center(child: CircularProgressIndicator()),
              BaseError<List<TimeEntry>>(failure: final failure) => Text(failure.title),
            }
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: AppButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddEditTaskPage(null)),
                          ),
                      buttonText: 'ADD TASK'),
                ),
                const Gap(AppSizes.spacingMd),
                Expanded(
                  child: AppButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddEditTimeEntryPage(null)),
                          ),
                      buttonText: 'ADD TIME ENTRY'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
