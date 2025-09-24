import 'package:go_router/go_router.dart';

import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/presentation/screens/screens.dart';

class AppRouter {
  AppRouter._();
  static GoRouter routers = GoRouter(
    initialLocation: AppRouterConstants.initialPath,
    routes: [
      GoRoute(
        path: AppRouterConstants.initialPath,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRouterConstants.homePath,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '${AppRouterConstants.detailsPath}/:id',
        builder: (context, state) {
          final breedId = state.pathParameters['id'];
          return DetailsScreen(breedId: int.parse(breedId ?? '0'));
        },
      ),
    ],
  );
}
