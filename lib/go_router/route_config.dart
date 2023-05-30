import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/screens/homepage.dart';
import 'package:go_router_practice/screens/page1.dart';
import '../screens/page2.dart';
import '../screens/page3.dart';
import '../screens/profile.dart';

class AppConfig {
  static bool isAuthenticated = false;

  AppConfig();

  static GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/page1',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        name: 'page1',
        path: '/page1',
        pageBuilder: (context, state) {
          return MaterialPage(child: Page1());
        },
      ),
      GoRoute(
        name: 'page2',
        path: '/page2',
        pageBuilder: (context, state) {
          return MaterialPage(child: Page2());
        },
      ),
      GoRoute(
        name: 'page3',
        path: '/page3',
        pageBuilder: (context, state) {
          return MaterialPage(child: Page3());
        },
      ),
      GoRoute(
          name: 'profile',
          path: '/profile/:username',
          pageBuilder: (context, state) {
            return MaterialPage(
                child: ProfilePage(
              userName: state.pathParameters['username'] ?? ' ',
            ));
          }),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
          child: Scaffold(
           appBar: AppBar(
             title: const Text('Error Page'),
           ),
            body: const Center(
             child:  Text('Error 404'),
        ),
       ),
      );
    },
  );
}
