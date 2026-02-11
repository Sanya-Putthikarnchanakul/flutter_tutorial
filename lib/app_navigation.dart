import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:temp/ui/core/ui/pages/error_page.dart';
import 'package:temp/ui/home/pages/home_page.dart';
import 'package:temp/ui/login/pages/login_page.dart';

class AppNavigation {
  static const home = '/';
  static const login = '/login';
  static const error = '/error';

  static GoRouter router() {
    return GoRouter(
      initialLocation: home,
      debugLogDiagnostics: kDebugMode ? true : false,
      routes: [
        GoRoute(
          path: login,
          builder: (_, __) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: home,
          builder: (_, __) {
            return HomePage();
          },
        ),
      ],
      errorBuilder: (context, state) {
        final goException = state.error;
        return ErrorPage(goException: goException);
      },
    );
  }
}
