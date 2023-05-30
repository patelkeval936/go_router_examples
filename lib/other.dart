import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

List<Widget> tabsWidgets = [];

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppScaffold();
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return tabsWidgets[0];
          },
        ),
        GoRoute(
          path: '/search',
          builder: (BuildContext context, GoRouterState state) {
            return tabsWidgets[1];
          },
        ),
        GoRoute(
          path: '/account',
          builder: (BuildContext context, GoRouterState state) {
            return tabsWidgets[2];
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerConfig: router,
    );
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
    // required this.child
  }) : super(key: key);
  // final Widget child;
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {

  List<Widget> getTabWidgets(BuildContext context) {
    return [
      Scaffold(
          body: Center(
              child: ElevatedButton(
                  onPressed: () {
                    // GoRouter.of(context).go('/search');
                    context.go('/search');
                  },
                  child: Text('Home')))),
      Scaffold(
          body: Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.go('/account');
                  },
                  child: Text('Search')))),
      Scaffold(
          body: Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  child: Text('Account')))),
      Scaffold(body: const Center(child: Text('Account'))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    tabsWidgets = getTabWidgets(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Demo App')),
      body: IndexedStack(index: _calculateSelectedIndex(context), children: [tabsWidgets[0], tabsWidgets[1], tabsWidgets[2]]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Account'),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/search')) {
      return 1;
    }
    if (location.startsWith('/account')) {
      return 2;
    }
    return 0;
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/home');
      case 1:
        return context.go('/search');
      case 2:
        return context.go('/account');
      default:
        return context.go('/home');
    }
  }
}
