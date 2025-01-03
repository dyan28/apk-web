import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/components/base_scaffold.dart';
import 'package:apkfree/screens/about_us/about_us_screen.dart';
import 'package:apkfree/screens/admin/admin_screen.dart';
import 'package:apkfree/screens/blog/blog_screen.dart';

import 'package:apkfree/screens/dashboard/dashboard_screen.dart';
import 'package:apkfree/screens/detail/detail_screen.dart';
import 'package:apkfree/utils/app_colors.dart';

/// The Routes class contains static constants and a map of named routes to widget builders for
/// navigation in a Flutter app.
class Routes {
  static const dashboardScreen = 'dashboard_screen';
  static const aboutUsScreen = 'about_us_screen';
  static const bookingScreen = 'booking_screen';
  static const blogScreen = 'blog_screen';
  static const shoppingScreen = 'shopping_screen';
  static const admin = 'admin';
  static const gameDetail = '';
  static const games = 'games';
  static const apps = 'apps';
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter routes = GoRouter(
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) => BaseScaffold(child: child),
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return DashBoardScreen();
            },
            routes: [
              GoRoute(
                path: games,
                builder: (BuildContext context, GoRouterState state) {
                  return Container(
                    child: Center(
                      child: Text("GAMES"),
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/:title',
                builder: (BuildContext context, GoRouterState state) {
                  final gameId = state.pathParameters['title'];
                  print("IDDDDD: $gameId");
                  return const DetailScreen();
                },
              ),
              GoRoute(
                path: apps,
                builder: (BuildContext context, GoRouterState state) {
                  return Container(
                    child: Center(
                      child: Text("APPS"),
                    ),
                  );
                },
              ),
              GoRoute(
                path: admin,
                builder: (BuildContext context, GoRouterState state) {
                  return const AdminScreen();
                },
              ),
            ],
          ),
        ],
      )

      // GoRoute(
      //   path: '/',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const DashBoardScreen();
      //   },
      //   routes: <RouteBase>[
      //     GoRoute(
      //       path: dashboardScreen,
      //       builder: (BuildContext context, GoRouterState state) {
      //         return const DashBoardScreen();
      //       },
      //     ),
      //     GoRoute(
      //       path: aboutUsScreen,
      //       builder: (BuildContext context, GoRouterState state) {
      //         return const AboutUsScreen();
      //       },
      //     ),
      //     GoRoute(
      //       path: '/:title',
      //       builder: (BuildContext context, GoRouterState state) {
      //         final gameId = state.pathParameters['title'];
      //         print("IDDDDD: $gameId");
      //         return const DetailScreen();
      //       },
      //     ),
      //     GoRoute(
      //       path: blogScreen,
      //       builder: (BuildContext context, GoRouterState state) {
      //         return const BlogScreen();
      //       },
      //     ),
      //     GoRoute(
      //       path: admin,
      //       builder: (BuildContext context, GoRouterState state) {
      //         return const AdminScreen();
      //       },
      //     ),
      //   ],
      // ),
    ],
  );

  static defaultRoute() => const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Sorry for the unexpected problem !',
              ),
            ),
            SizedBox(height: 19),
          ],
        ),
      );
}
