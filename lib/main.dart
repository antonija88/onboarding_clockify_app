import 'package:flutter/material.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/features/home/presentation/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLoading = ref.watch(globalLoadingProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      home: Stack(
        children: [const MyHomePage(title: 'CLOCKIFY'), if (showLoading) const BaseLoadingIndicator()],
      ),
    );
  }
}
