import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          const Text('test'),
          TextButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('to Home'),
          ),
        ],
      )),
    );
  }
}
