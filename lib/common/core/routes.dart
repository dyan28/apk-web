import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:students/screens/about_us/about_us_screen.dart';
import 'package:students/screens/blog/blog_screen.dart';
import 'package:students/screens/booking/booking_screen.dart';

import 'package:students/screens/dashboard/dashboard_screen.dart';
import 'package:students/screens/shopping/shopping_screen.dart';

/// The Routes class contains static constants and a map of named routes to widget builders for
/// navigation in a Flutter app.
class Routes {
  static const dashboardScreen = 'dashboard_screen';
  static const aboutUsScreen = 'about_us_screen';
  static const bookingScreen = 'booking_screen';
  static const blogScreen = 'blog_screen';
  static const shoppingScreen = 'shopping_screen';

  static final GoRouter routes =  GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const DashBoardScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: dashboardScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const DashBoardScreen();
            },
          ),
          GoRoute(
            path: aboutUsScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const AboutUsScreen();
            },
          ),
          GoRoute(
            path: bookingScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const BookingScreen();
            },
          ),
          GoRoute(
            path: blogScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const BlogScreen();
            },
          ),
          GoRoute(
            path: shoppingScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const ShoppingScreen();
            },
          ),
        ],
      ),
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
