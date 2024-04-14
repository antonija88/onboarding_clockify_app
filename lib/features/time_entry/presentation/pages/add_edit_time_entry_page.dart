import 'package:flutter/material.dart';
import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/core/data/presentation/widgets/app_button.dart';
import 'package:onboarding_clockify_app/features/time_entry/di.dart';
import 'package:onboarding_clockify_app/features/time_entry/domain/entities/time_entry.dart';
import 'package:onboarding_clockify_app/core/data/presentation/constants/app_sizes.dart';

class AddEditTimeEntryPage extends HookConsumerWidget {
  AddEditTimeEntryPage(this.timeEntry, {super.key});

  final TimeEntry? timeEntry;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeEntryState = ref.watch(timeEntryNotifierProvider);

    ref.listen<BaseState<String>>(manageTimeEntryProvider, (_, next) {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'TIME ENTRY',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: switch (timeEntryState) {
        BaseInitial<List<TimeEntry>>() => const Text('Initial'),
        BaseLoading() => const Center(child: CircularProgressIndicator()),
        BaseData(data: final tasks) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const Gap(AppSizes.spacingMd),
                    FormBuilderTextField(
                      name: 'timeEntryDescription',
                      initialValue: timeEntry?.description,
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
                        hintText: 'Add description',
                        hintStyle: const TextStyle(color: Colors.black87),
                        contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                      ),
                    ),
                    const Gap(AppSizes.spacingMd),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: 'start',
                            initialValue: timeEntry?.timeInterval.start,
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
                              hintText: 'Enter start time',
                              hintStyle: const TextStyle(color: Colors.black87),
                              contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                            ),
                          ),
                        ),
                        const Gap(AppSizes.spacingMd),
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: 'end',
                            initialValue: timeEntry?.timeInterval.end,
                            validator: (value) {
                              if (value != null) {
                                if (value.compareTo(_formKey.currentState?.value['start']) < 0) {
                                  return 'End date not valid.';
                                }
                              }
                              return null;
                            },
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
                              hintText: 'Enter end time',
                              hintStyle: const TextStyle(color: Colors.black87),
                              contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    if (timeEntry != null)
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
                                        ref.watch(manageTimeEntryProvider.notifier).updateTimeEntry(
                                            timeEntry!.id, formMap?['timeEntryDescription'], formMap?['start'], formMap?['end']);
                                      }
                                    },
                                    buttonText: 'Edit')),
                            const Gap(AppSizes.spacingMd),
                            Expanded(
                                child: AppButton(
                                    onPressed: () {
                                      ref.watch(manageTimeEntryProvider.notifier).deleteTimeEntry(timeEntry!.id);
                                    },
                                    buttonText: 'Delete')),
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
                                      ref
                                          .watch(manageTimeEntryProvider.notifier)
                                          .addTimeEntry(formMap?['timeEntryDescription'], formMap?['start'], formMap?['end']);
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
          ),
        BaseError(failure: final failure) => Text(failure.title),
      },
    );
  }
}
