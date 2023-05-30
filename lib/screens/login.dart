import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/go_router/route_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginPage'),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              setState(() {
                AppConfig.isAuthenticated = !AppConfig.isAuthenticated;
              });
              if (AppConfig.isAuthenticated) {
                GoRouter.of(context).pushReplacementNamed('profile', pathParameters: {'username': 'patelkeval'});
              }
            },
            child: !AppConfig.isAuthenticated ? Text('Log In') : Text('Log Out'),
          ),
        ));
  }
}
