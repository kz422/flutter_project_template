import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _AppBase(),
    );
  }
}

class _AppBase extends StatelessWidget {
  const _AppBase();

  @override
  Widget build(BuildContext context) {
    const env = String.fromEnvironment('flavor');
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(env),
      ),
    );
  }
}
