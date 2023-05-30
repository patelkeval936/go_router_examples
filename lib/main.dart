import 'package:flutter/material.dart';
import 'package:go_router_practice/go_router/route_config.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router_example',
      theme: ThemeData.dark(),
      routerDelegate: AppConfig.goRouter.routerDelegate,
      routeInformationParser: AppConfig.goRouter.routeInformationParser,
    );
  }
}
