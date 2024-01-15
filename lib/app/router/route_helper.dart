import 'package:animus_mobile_flutter/app/router/route_path.dart';
import 'package:animus_mobile_flutter/presentation/details/anime_details_screen.dart';
import 'package:animus_mobile_flutter/presentation/home/home_screen.dart';
import 'package:animus_mobile_flutter/presentation/navigation/navigation_screen.dart';
import 'package:animus_mobile_flutter/presentation/player/player_screen.dart';
import 'package:animus_mobile_flutter/presentation/profile/profile_screen.dart';
import 'package:animus_mobile_flutter/presentation/search/search_screen.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteHelper {
  static RouteHelper get _instance => RouteHelper();

  static RouteHelper get instance => _instance;

  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final homeTabNavigatorKey = GlobalKey<NavigatorState>();
  static final searchTabNavigatorKey = GlobalKey<NavigatorState>();
  static final profileTabNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter getRouter() {
    return GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: RoutePath.home,
      routes: routes,
      observers: kDebugMode ? [ChuckerFlutter.navigatorObserver] : null,
    );
  }

  static final routes = [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          navigatorKey: homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: RoutePath.home,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const HomeScreen(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: searchTabNavigatorKey,
          routes: [
            GoRoute(
              path: RoutePath.search,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const SearchScreen(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: profileTabNavigatorKey,
          routes: [
            GoRoute(
              path: RoutePath.profile,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const ProfileScreen(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ],
      pageBuilder: (context, state, navigationShell) {
        return getPage(
          child: NavigationScreen(
            child: navigationShell,
          ),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: RoutePath.details,
      builder: (context, state) => AnimeDetailsScreen(
        animeId: state.extra as int,
      ),
    ),
    GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: RoutePath.player,
      builder: (context, state) => PlayerScreen(
        videoId: state.extra.toString(),
      ),
    ),
  ];

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
