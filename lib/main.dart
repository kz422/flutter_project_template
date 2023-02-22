import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'common_widgets/nothing.dart';
import 'providers/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}

class AppBase extends StatelessWidget {
  const AppBase({super.key});

  @override
  Widget build(BuildContext context) {
    const env = String.fromEnvironment('flavor');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            env == 'dev' ? const Text(env) : const Nothing(),
            TextButton(
              onPressed: () {
                context.go('/info');
              },
              child: const Text('to info'),
            ),
          ],
        ),
      ),
    );
  }
}
