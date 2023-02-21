import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../feature/info/info_page.dart';
import '../main.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const AppBase(),
      ),
      GoRoute(
        path: '/info',
        builder: (_, __) => const InfoPage(),
      ),
    ],
  ),
);
