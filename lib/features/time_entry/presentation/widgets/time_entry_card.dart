import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onboarding_clockify_app/features/time_entry/data/models/time_interval.dart';

class TimeEntryCard extends StatelessWidget {
  final Function() onTap;

  final String? description;
  final TimeInterval timeInterval;
  const TimeEntryCard({super.key, required this.onTap, required this.timeInterval, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description: ${description != null ? '$description' : '-'} ',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              const Gap(10),
              Text(
                'Minutes: ${timeInterval.duration.substring(2)}',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              const Gap(10),
              Text(
                'Duration: ${timeInterval.start.hour.toString()}:${timeInterval.start.minute.toString()} - ${timeInterval.end.hour.toString()}:${timeInterval.end.minute.toString()}',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
